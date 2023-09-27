CREATE TABLE `fakultas`  (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mahasiswa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `kampus`  (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mahasiswa` varchar(255) NULL,
  `fakultas` varchar(255) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `lulus`  (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nilai` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fakultas` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matakuliah` varchar(255) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `mahasiswa`  (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(255) NULL,
  `fakultas` varchar(255) NULL,
  `kampus` varchar(255) NULL,
  `lulus` varchar(255) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `matakuliah`  (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nilai` varchar(255) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `nilai`  (
  `id` int AS () NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matakuliah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `fakultas` ADD CONSTRAINT `fk_fakultas_mahasiswa_1` FOREIGN KEY (`id`) REFERENCES `mahasiswa` (`fakultas`);
ALTER TABLE `kampus` ADD CONSTRAINT `fk_kampus_mahasiswa_1` FOREIGN KEY (`id`) REFERENCES `mahasiswa` (`kampus`);
ALTER TABLE `lulus` ADD CONSTRAINT `fk_lulus_mahasiswa_1` FOREIGN KEY (`id`) REFERENCES `mahasiswa` (`lulus`);
ALTER TABLE `matakuliah` ADD CONSTRAINT `fk_matakuliah_nilai_1` FOREIGN KEY (`id`) REFERENCES `nilai` (`matakuliah`);
ALTER TABLE `nilai` ADD CONSTRAINT `fk_nilai_lulus_1` FOREIGN KEY (`id`) REFERENCES `lulus` (`nilai`);

