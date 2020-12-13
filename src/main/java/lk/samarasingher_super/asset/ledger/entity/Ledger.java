package lk.samarasingher_super.asset.ledger.entity;


import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lk.samarasingher_super.asset.common_asset.model.enums.LiveOrDead;
import lk.samarasingher_super.asset.good_received_note.entity.GoodReceivedNote;
import lk.samarasingher_super.asset.item.entity.Item;
import lk.samarasingher_super.util.audit.AuditEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonFilter( "Ledger" )
public class Ledger extends AuditEntity {

    @NotEmpty
    private String quantity;

    @Column( nullable = false, precision = 10, scale = 2 )
    private BigDecimal sellPrice;

    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private LocalDate manufactureDate;

    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private LocalDate expiredDate;

    @Enumerated( EnumType.STRING)
    private LiveOrDead liveOrDead;

    @ManyToOne
    @JsonManagedReference
    private Item item;

    @ManyToOne
    @JsonIgnore
    private GoodReceivedNote goodReceivedNote;


}
