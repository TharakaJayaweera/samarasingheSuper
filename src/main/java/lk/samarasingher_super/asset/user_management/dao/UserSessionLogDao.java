package lk.samarasingher_super.asset.user_management.dao;

import lk.samarasingher_super.asset.user_management.entity.Enum.UserSessionLogStatus;
import lk.samarasingher_super.asset.user_management.entity.User;
import lk.samarasingher_super.asset.user_management.entity.UserSessionLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserSessionLogDao extends JpaRepository<UserSessionLog, Integer > {
    UserSessionLog findByUserAndUserSessionLogStatus(User user, UserSessionLogStatus userSessionLogStatus);
}