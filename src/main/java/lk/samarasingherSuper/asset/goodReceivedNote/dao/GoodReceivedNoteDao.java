package lk.samarasingherSuper.asset.goodReceivedNote.dao;

import lk.samarasingherSuper.asset.PurchaseOrder.entity.PurchaseOrder;
import lk.samarasingherSuper.asset.goodReceivedNote.entity.GoodReceivedNote;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GoodReceivedNoteDao extends JpaRepository<GoodReceivedNote, Integer> {
  GoodReceivedNote findByPurchaseOrder(PurchaseOrder purchaseOrder);
}
