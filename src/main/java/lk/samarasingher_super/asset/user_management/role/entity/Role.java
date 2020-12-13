package lk.samarasingher_super.asset.user_management.role.entity;

import lk.samarasingher_super.asset.common_asset.model.enums.ActiveOrInactive;
import lk.samarasingher_super.asset.user_management.user.entity.User;
import lk.samarasingher_super.util.audit.AuditEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Role extends AuditEntity {

    @NotNull
    @Column( unique = true )
    private String roleName;

    @Enumerated(EnumType.STRING)
    private ActiveOrInactive activeOrInactive;

    @ManyToMany(mappedBy = "roles")
    private List< User > users;
}
