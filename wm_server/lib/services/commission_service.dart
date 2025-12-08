import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

/// Service for calculating and distributing MLM commissions
class CommissionService {
  /// Calculate and distribute reaper commissions for a completed sale
  /// Walks up the referral chain (up to 7 levels) and creates commission records
  Future<List<Commissions>> calculateReaperCommissions(
    Session session,
    Sale sale,
  ) async {
    final commissions = <Commissions>[];

    // Get the buyer to start walking up the referral chain
    final buyer = await User.db.findById(session, sale.buyerId);
    if (buyer == null) {
      session.log('CommissionService: Buyer not found for sale ${sale.id}');
      return commissions;
    }

    // Get the reaper commission rates for this package
    final reaperRates = await ReaperCommission.db.find(
      session,
      where: (t) =>
          t.packageId.equals(sale.packageId) & t.isActive.equals(true),
    );

    if (reaperRates.isEmpty) {
      session.log(
          'CommissionService: No reaper commission rates found for package ${sale.packageId}');
      return commissions;
    }

    // Build a map of level -> commission rate for quick lookup
    final rateByLevel = <int, ReaperCommission>{};
    for (final rate in reaperRates) {
      rateByLevel[rate.level] = rate;
    }

    // Walk up the referral chain (max 7 levels)
    int? currentReferrerId = buyer.referrerId;
    int currentLevel = 1;

    while (currentReferrerId != null && currentLevel <= 7) {
      final referrer = await User.db.findById(session, currentReferrerId);
      if (referrer == null) break;

      // Check if this level has a commission rate
      final rate = rateByLevel[currentLevel];
      if (rate != null && rate.netPerMember > 0) {
        // Create commission record
        final commission = Commissions(
          saleId: sale.id!,
          recipientId: referrer.id!,
          sourceLevel: currentLevel,
          commissionType: 'reaper',
          commissionAmount: rate.netPerMember,
          isPaid: false,
          paidAt: null,
          createdAt: DateTime.now(),
        );
        commissions.add(commission);

        session.log(
          'CommissionService: Level $currentLevel commission ${rate.netPerMember} to user ${referrer.id}',
        );
      }

      // Move up the chain
      currentReferrerId = referrer.referrerId;
      currentLevel++;
    }

    // Bulk insert all commissions
    if (commissions.isNotEmpty) {
      await Commissions.db.insert(session, commissions);
      session.log(
          'CommissionService: Created ${commissions.length} commission records for sale ${sale.id}');
    }

    return commissions;
  }

  /// Calculate golden seat commissions for a sale
  Future<List<Commissions>> calculateGoldenSeatCommissions(
    Session session,
    Sale sale,
  ) async {
    final commissions = <Commissions>[];

    // Get golden seat commission rates
    final gsRates = await GoldenSeatCommission.db.find(
      session,
      where: (t) => t.packageId.equals(sale.packageId),
    );

    if (gsRates.isEmpty) {
      return commissions;
    }

    // Get all active golden seat holders
    final goldenSeats = await GoldenSeats.db.find(
      session,
      where: (t) => t.isActive.equals(true),
    );

    for (final gs in goldenSeats) {
      // Find matching rate for this seat type
      final rate = gsRates.firstWhere(
        (r) => r.seatType == gs.seatType,
        orElse: () => gsRates.first,
      );

      if (rate.commissionAmount > 0) {
        final commission = Commissions(
          saleId: sale.id!,
          recipientId: gs.ownerId,
          sourceLevel: 0, // Golden seat is level 0
          commissionType: 'golden_seat',
          commissionAmount: rate.commissionAmount,
          isPaid: false,
          paidAt: null,
          createdAt: DateTime.now(),
        );
        commissions.add(commission);
      }
    }

    if (commissions.isNotEmpty) {
      await Commissions.db.insert(session, commissions);
      session.log(
          'CommissionService: Created ${commissions.length} golden seat commissions for sale ${sale.id}');
    }

    return commissions;
  }

  /// Process all commissions for a completed sale
  Future<List<Commissions>> processCommissionsForSale(
    Session session,
    Sale sale,
  ) async {
    final allCommissions = <Commissions>[];

    // Calculate reaper commissions (upline bonuses)
    final reaperCommissions = await calculateReaperCommissions(session, sale);
    allCommissions.addAll(reaperCommissions);

    // Calculate golden seat commissions
    final gsCommissions = await calculateGoldenSeatCommissions(session, sale);
    allCommissions.addAll(gsCommissions);

    session.log(
      'CommissionService: Processed ${allCommissions.length} total commissions for sale ${sale.id}',
    );

    return allCommissions;
  }
}
