package lk.samarasingher_super.asset.invoice_item.entity;


import com.fasterxml.jackson.annotation.JsonFilter;
import lk.samarasingher_super.asset.common_asset.model.enums.ActiveOrInactive;
import lk.samarasingher_super.asset.invoice.entity.Invoice;
import lk.samarasingher_super.asset.item.entity.Item;
import lk.samarasingher_super.util.audit.AuditEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonFilter("InvoiceItem")
public class InvoiceItem extends AuditEntity {

    @Column(nullable = false)
    private String quantity;

    @Column( nullable = false, precision = 10, scale = 2 )
    private BigDecimal sellPrice;

    @Enumerated( EnumType.STRING)
    private ActiveOrInactive activeOrInactive;

    @ManyToOne
    private Item item;

    @ManyToOne
    private Invoice invoice;

}
