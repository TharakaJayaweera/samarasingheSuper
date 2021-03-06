package lk.samarasingher_super.asset.invoice.dao;


import lk.samarasingher_super.asset.invoice.entity.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface InvoiceDao extends JpaRepository< Invoice, Integer > {
    List< Invoice > findByCreatedAtIsBetween(LocalDateTime form, LocalDateTime to);

    Invoice findFirstByOrderByIdDesc();

}
