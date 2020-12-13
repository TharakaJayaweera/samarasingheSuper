package lk.samarasingher_super.asset.common_asset.model.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ActiveOrInactive {
    ACTIVE("Active"),
    STOP("Stop");

    private final String activeOrInactive;
}
