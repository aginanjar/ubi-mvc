-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.38-0ubuntu0.14.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for teras_sosis
CREATE DATABASE IF NOT EXISTS `teras_sosis` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `teras_sosis`;


-- Dumping structure for table teras_sosis.jenis
CREATE TABLE IF NOT EXISTS `jenis` (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(50) DEFAULT NULL,
  `stok` int(4) DEFAULT '0',
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table teras_sosis.kasir
CREATE TABLE IF NOT EXISTS `kasir` (
  `id_kasir` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kasir` varchar(100) NOT NULL,
  `alamat` text,
  PRIMARY KEY (`id_kasir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table teras_sosis.meja
CREATE TABLE IF NOT EXISTS `meja` (
  `no_meja` int(11) NOT NULL AUTO_INCREMENT,
  `kapasitas` int(10) DEFAULT '0',
  `status` tinyint(2) DEFAULT '0',
  `keterangan` text,
  PRIMARY KEY (`no_meja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table teras_sosis.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(150) DEFAULT NULL,
  `harga` float DEFAULT NULL,
  `gambar` varchar(200) DEFAULT NULL,
  `deskripsi` text,
  `id_jenis` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `id_jenis` (`id_jenis`),
  CONSTRAINT `fk_jenis_id` FOREIGN KEY (`id_jenis`) REFERENCES `jenis` (`id_jenis`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table teras_sosis.pelanggan
CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `id_meja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`),
  KEY `id_meja` (`id_meja`),
  CONSTRAINT `fk_id_meja` FOREIGN KEY (`id_meja`) REFERENCES `meja` (`no_meja`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table teras_sosis.pesanan
CREATE TABLE IF NOT EXISTS `pesanan` (
  `id_pesan` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `quantity` int(4) DEFAULT '0',
  `sub_total` float DEFAULT '0',
  `total` float DEFAULT '0',
  `id_menu` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  PRIMARY KEY (`id_pesan`),
  KEY `id_menu` (`id_menu`),
  KEY `id_pelanggan` (`id_pelanggan`),
  KEY `id_kasir` (`id_kasir`),
  CONSTRAINT `fk_pelanggan_id` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_kasir_id` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_id` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table teras_sosis.telepon
CREATE TABLE IF NOT EXISTS `telepon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kasir` int(11) DEFAULT NULL,
  `no_telp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kasir` (`id_kasir`),
  CONSTRAINT `fk_telp_kasir_id` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
