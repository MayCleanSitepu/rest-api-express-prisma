-- CreateTable
CREATE TABLE `Faskes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tahun` INTEGER NOT NULL,
    `provinsi` VARCHAR(191) NOT NULL,
    `kabkota` VARCHAR(191) NOT NULL,
    `id_kabkot` INTEGER NOT NULL,
    `jenis_faskes` VARCHAR(191) NOT NULL,
    `faskes` VARCHAR(191) NOT NULL,
    `id_fas` INTEGER NOT NULL,
    `jumlah_kasus_tb_terkonfirmasi` INTEGER NOT NULL,
    `jumlah_kasus_tb_diobati` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Provinsi` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tahun` INTEGER NOT NULL,
    `provinsi` VARCHAR(191) NOT NULL,
    `jumlah_penduduk` INTEGER NOT NULL,
    `estimasi_kasus_tb_baru` INTEGER NOT NULL,
    `case_notification_rate` DOUBLE NOT NULL,
    `treatment_coverage` DOUBLE NOT NULL,
    `jumlah_kasus_tb_terkonfirmasi` INTEGER NOT NULL,
    `jumlah_kasus_tb_diobati` INTEGER NOT NULL,
    `jumlah_kasus_tb_dari_puskesmas` INTEGER NOT NULL,
    `jumlah_kasus_tb_dari_rs_pemerintah` INTEGER NOT NULL,
    `jumlah_kasus_tb_dari_rs_swasta_klinik` INTEGER NOT NULL,
    `kasus_perempuan` INTEGER NOT NULL,
    `kasus_laki_laki` INTEGER NOT NULL,
    `kasus_anak_muda` INTEGER NOT NULL,
    `kasus_dewasa` INTEGER NOT NULL,
    `kasus_lansia` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
