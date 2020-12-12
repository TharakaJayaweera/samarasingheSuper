package lk.samarasingher_super.asset.supplier.dao;

import lk.samarasingher_super.asset.item.entity.Item;
import lk.samarasingher_super.asset.supplier.entity.Supplier;
import lk.samarasingher_super.asset.supplier.entity.SupplierItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SupplierItemDao extends JpaRepository<SupplierItem, Integer> {
    SupplierItem findBySupplierAndItem(Supplier supplier, Item item);

    List<SupplierItem> findBySupplier(Supplier supplier);
}
