import 'package:wafir_mobile/core/extensions/extensions.dart';
import 'package:wafir_mobile/features/sectors/data/response/sector_response.dart';
import 'package:wafir_mobile/features/sectors/domain/model/sector_model.dart';

extension SectorMapper on SectorResponse {
  SectorModel toDomain() {
    return SectorModel(
      id: id.onNull(),
      name: name.onNull(),
      iconUrl: iconUrl.onNull(),
      status: status.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
    );
  }
}
