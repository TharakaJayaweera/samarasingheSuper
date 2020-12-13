package lk.samarasingher_super.asset.category.entity;

import com.fasterxml.jackson.annotation.JsonFilter;
import lk.samarasingher_super.asset.common_asset.model.enums.ActiveOrInactive;
import lk.samarasingher_super.asset.item.entity.Enum.MainCategory;
import lk.samarasingher_super.asset.item.entity.Item;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonFilter( "Category" )
public class Category {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    private Integer id;

    @Enumerated(EnumType.STRING)
    private MainCategory mainCategory;

    @Enumerated(EnumType.STRING)
    private ActiveOrInactive activeOrInactive;

    @Size( min = 3, message = "Your name cannot be accepted" )
    private String name;

    @OneToMany(mappedBy = "category",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Item> items;
}
