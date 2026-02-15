/// สิทธิ์ผู้ใช้ — ใช้เป็นฐานสำหรับ middleware แสดง UI/ฟีเจอร์ตาม role
/// - [citizen] นาย ก: ผู้รับแจ้งเตือน, ขอความช่วยเหลือได้
/// - [coordinator] นาย ข: คนประสานงาน แจ้งเหตุในพื้นที่ได้
/// - [areaDeveloper] นาย ค: นักพัฒนาพื้นที่ สร้างจุดยุทธศาสตร์ได้
enum UserRole {
  citizen,
  coordinator,
  areaDeveloper,
}

extension UserRoleX on UserRole {
  /// คืนค่า string สำหรับส่งกลับ API หรือเทียบกับ [UserData.role]
  String get value {
    return switch (this) {
      UserRole.citizen => 'citizen',
      UserRole.coordinator => 'coordinator',
      UserRole.areaDeveloper => 'area_developer',
    };
  }
}

/// แปลงจากค่าที่ API ส่งใน [UserData.role]
/// คืน [UserRole.citizen] ถ้าไม่รู้จักหรือ null (user ทั่วไป)
UserRole userRoleFromString(String? role) {
  if (role == null || role.isEmpty) return UserRole.citizen;
  final normalized = role.trim().toLowerCase();
  return switch (normalized) {
    'citizen' => UserRole.citizen,
    'coordinator' => UserRole.coordinator,
    'area_developer' => UserRole.areaDeveloper,
    'areadeveloper' => UserRole.areaDeveloper,
    _ => UserRole.citizen,
  };
}
