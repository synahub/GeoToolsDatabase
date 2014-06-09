-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 15, 2014 at 12:19 AM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `smartgeotoolsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` int(11) NOT NULL,
  `idcity` int(11) DEFAULT NULL,
  `bookingdesc` varchar(250) DEFAULT NULL,
  `datetrip` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `paymentmode` varchar(150) DEFAULT NULL,
  `bookingdate` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `courtierid` int(11) DEFAULT NULL,
  `pointofinterestid` int(11) DEFAULT NULL,
  `idsite` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `bookingid` (`bookingid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `idcity` int(11) NOT NULL,
  `idzone` int(11) NOT NULL,
  `namecity` varchar(70) NOT NULL,
  `desccity` varchar(250) DEFAULT NULL,
  `latcity` float(10,6) DEFAULT NULL,
  `lngcity` float(10,6) DEFAULT NULL,
  `altcity` int(11) DEFAULT NULL,
  `cityurlimage` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `idcity` (`idcity`),
  UNIQUE KEY `namecity` (`namecity`),
  UNIQUE KEY `idcity_2` (`idcity`),
  KEY `fk_zonegeo` (`idzone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`_id`, `idcity`, `idzone`, `namecity`, `desccity`, `latcity`, `lngcity`, `altcity`, `cityurlimage`) VALUES
(1, 1, 1, 'Goma', 'Ville au bord du lac kivu et sur le flanc du Nyiragongo', -1.654586, 29.220371, 1678, 'http://192.168.56.1:8080/mobitours/images/test0.jpg'),
(2, 2, 1, 'Beni', 'Une des grande ville du Grand-nord au flanc du Mt Ruwenzori', 0.490946, 29.458981, 1678, 'http://192.168.56.1:8080/mobitours/images/cbeni.jpg'),
(3, 3, 1, 'Butembo', 'desc desc desc desc', -0.775839, 28.913801, 1678, 'http://192.168.56.1:8080/mobitours/images/test1.jpg'),
(4, 4, 1, 'Masisi', 'desc desc desc desc', -1.398324, 28.818302, 1678, 'http://192.168.56.1:8080/mobitours/images/test2.jpg'),
(5, 5, 1, 'Sake', 'desc desc desc desc', -0.561220, 28.705357, 1678, 'http://192.168.56.1:8080/mobitours/images/test3.jpg'),
(6, 6, 1, 'Kitshanga', 'desc desc desc desc', -0.972840, 28.698214, 1678, NULL),
(7, 7, 1, 'Rutshuru', 'desc desc desc desc', -1.160556, 29.382500, 1678, NULL),
(8, 8, 1, 'Bunagana', 'desc desc desc desc', -1.313035, 29.595379, 1678, NULL),
(9, 9, 1, 'Rumangabo', 'desc desc desc desc', -1.357663, 29.369062, 1678, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `pointofinterestid` int(11) DEFAULT NULL,
  `idsite` int(11) DEFAULT NULL,
  `text` varchar(200) NOT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_id_fk` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `courtier`
--

CREATE TABLE `courtier` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `courtierid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `biography` varchar(100) DEFAULT NULL,
  `specification` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `courtierid` (`courtierid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `datatype`
--

CREATE TABLE `datatype` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `dataid` int(11) NOT NULL,
  `titletype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `dataid` (`dataid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `datatype`
--

INSERT INTO `datatype` (`_id`, `dataid`, `titletype`) VALUES
(1, 1, 'hotel'),
(2, 2, 'restaurant'),
(3, 3, 'others');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `pointofinterestid` int(11) NOT NULL,
  `idcity` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(120) NOT NULL,
  `url` varchar(120) DEFAULT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `adresse` varchar(250) DEFAULT NULL,
  `deschotel` varchar(250) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `nbroom` int(11) DEFAULT NULL,
  `nbroomdispo` int(11) DEFAULT NULL,
  `roompricemin` float DEFAULT NULL,
  `roompricemax` float DEFAULT NULL,
  `mail` varchar(60) DEFAULT NULL,
  `pictureurl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `pointofinterestid` (`pointofinterestid`),
  KEY `city_id_fk` (`idcity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`_id`, `pointofinterestid`, `idcity`, `title`, `type`, `url`, `latitude`, `longitude`, `adresse`, `deschotel`, `star`, `nbroom`, `nbroomdispo`, `roompricemin`, `roompricemax`, `mail`, `pictureurl`) VALUES
(1, 1, 1, 'Grands Lacs Hotel', 'hotel', 'www.grandslacshotel.com', -1.690314, 29.238443, 'Bld Kanyamunga, ville', 'One of old goma''s hotels', 2, 50, 12, 65, 200, '', 'http://192.168.56.1:8080/mobitours/images/goma.jpg'),
(2, 2, 1, 'New look Hotel', 'hotel', 'www.newlookhotel-goma.com', -1.693030, 29.238688, 'Bld Kanyamunga, ville', 'Hotel with all you want', 2, 20, 2, 50, 125, '', 'http://192.168.56.1:8080/mobitours/images/chalet_a.jpg'),
(3, 3, 1, 'Ihusi Hotel', 'hotel', 'www.ihusi.com', -1.698727, 29.242474, 'Bld Kanyamunga, ville', 'one of the best of goma', 4, 180, 3, 65, 500, '', 'http://192.168.56.1:8080/mobitours/images/chalet_b.jpg'),
(4, 4, 1, 'Test Hotel', 'hotel', 'www.cosyscd.com', -1.696810, 29.241812, 'Bld Kanyamunga, ville', 'just for testing 1', 4, 18, 11, 25, 200, '', 'http://192.168.56.1:8080/mobitours/images/hotel_ihusi.jpg'),
(5, 5, 1, 'Test Big Hotel', 'hotel', 'www.mobilex.com', -1.683780, 29.234919, 'Bld Kanyamunga, ville', 'just another for testing', 4, 200, 46, 25, 700, '', 'http://192.168.56.1:8080/mobitours/images/chalet_c.jpg'),
(6, 6, 1, 'Hotel Bassin du Congo', 'hotel', 'www.bassincongo.com', -1.694169, 29.242376, 'Bld Kanyamunga, ville', 'just another for testing', 4, 140, 100, 30, 200, '', 'http://192.168.56.1:8080/mobitours/images/chalet_d.jpg'),
(7, 7, 1, 'Centre d''acceuil Caritas', 'hotel', 'www.caritas.cd', -1.700056, 29.242474, 'Bld Kanyamunga, ville', 'just another for testing', 4, 40, 13, 25, 125, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pointofinterestid` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  `image` blob NOT NULL,
  `imagetype` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Image informations' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `otherpoi`
--

CREATE TABLE `otherpoi` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `pointofinterestid` int(11) NOT NULL,
  `idcity` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(120) NOT NULL,
  `url` varchar(120) DEFAULT NULL,
  `specification` varchar(100) DEFAULT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `pictureurl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `pointofinterestid` (`pointofinterestid`),
  KEY `city_id_fk` (`idcity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `pointofinterestid` int(11) DEFAULT NULL,
  `idsite` int(11) DEFAULT NULL,
  `rating` float(10,6) NOT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_rat_id_fk` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`_id`, `userid`, `pointofinterestid`, `idsite`, `rating`, `date`) VALUES
(1, 1, 1, 0, 5.000000, 0),
(2, 1, 1, 0, 3.000000, 0),
(3, 1, 3, 0, 4.000000, 0),
(4, 1, 3, 0, 5.000000, 0),
(5, 1, 3, 0, 4.000000, 0),
(6, 1, 4, 0, 2.000000, 0),
(7, 1, 0, 1, 4.000000, 0),
(8, 1, 0, 1, 3.000000, 0),
(9, 1, 0, 1, 5.000000, 0),
(10, 1, 0, 2, 3.000000, 0),
(11, 1, 0, 2, 2.000000, 0),
(12, 1, 0, 2, 5.000000, 0),
(13, 1, 0, 2, 3.000000, 0),
(14, 1, 0, 2, 5.000000, 0),
(15, 1, 0, 2, 2.000000, 0),
(16, 1, 0, 3, 5.000000, 0),
(17, 1, 0, 3, 2.000000, 0),
(18, 1, 0, 3, 2.000000, 0),
(19, 1, 0, 4, 2.000000, 0),
(20, 1, 0, 4, 3.000000, 0),
(21, 1, 0, 4, 1.000000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `pointofinterestid` int(11) NOT NULL,
  `idcity` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(120) NOT NULL,
  `url` varchar(120) DEFAULT NULL,
  `classification` varchar(75) DEFAULT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `mealofday` varchar(250) DEFAULT NULL,
  `mealprice` varchar(250) DEFAULT NULL,
  `pictureurl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `pointofinterestid` (`pointofinterestid`),
  KEY `city_id_fk` (`idcity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sitenaturel`
--

CREATE TABLE `sitenaturel` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `idsite` int(11) NOT NULL,
  `idcity` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `type` varchar(65) NOT NULL,
  `area` float(10,6) DEFAULT NULL,
  `sitedesc` varchar(100) DEFAULT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `attractourist` varchar(250) DEFAULT NULL,
  `largeur` float(10,6) NOT NULL,
  `longueur` float(10,6) NOT NULL,
  `security` varchar(1) DEFAULT NULL,
  `visitorperan` int(11) DEFAULT NULL,
  `site_url_image` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `idsite` (`idsite`),
  KEY `city_site_id_fk` (`idcity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sitenaturel`
--

INSERT INTO `sitenaturel` (`_id`, `idsite`, `idcity`, `title`, `type`, `area`, `sitedesc`, `latitude`, `longitude`, `attractourist`, `largeur`, `longueur`, `security`, `visitorperan`, `site_url_image`) VALUES
(1, 1, 1, 'Parc National des Virunga', 'Parc', 0.000000, '', -0.383333, 29.500000, 'Un des plus vieux parcs', 0.000000, 0.000000, 'N', 255, NULL),
(2, 2, 1, 'Montagnes du Virunga', 'Site', 0.000000, '', -1.416667, 29.500000, 'Parmis les plus hautes', 0.000000, 0.000000, 'N', 35, NULL),
(3, 3, 1, 'Nyamurariga', 'Site', 0.000000, '', -1.408000, 29.200001, 'Un des volcans actifs', 0.000000, 0.000000, 'Y', 1245, NULL),
(4, 4, 1, 'Sabyinyo', 'Site', 0.000000, '', -1.388000, 29.591999, 'Un des volcans actifs', 0.000000, 0.000000, 'Y', 1545, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `typeid` (`typeid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`_id`, `typeid`, `type`) VALUES
(1, 1, 'Hotel'),
(2, 2, 'Restaurant'),
(3, 3, 'Nature'),
(4, 4, 'Culture'),
(5, 5, 'Atm'),
(6, 6, 'Petrol station'),
(7, 7, 'Pharmacies'),
(8, 8, 'Hospital'),
(9, 9, 'Shopping'),
(10, 10, 'schools');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `usern` varchar(15) NOT NULL DEFAULT '',
  `pswd` varchar(15) NOT NULL DEFAULT '',
  `type-acc` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `biography` varchar(200) DEFAULT NULL,
  `Uid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `Uid` (`Uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `usern`, `pswd`, `type-acc`, `email`, `title`, `lastname`, `firstname`, `website`, `city`, `country`, `company`, `phone`, `biography`, `Uid`) VALUES
(1, 'admin', 'root', 'admin', 'misamuna@gmail.com', 'M', 'Isamuna', 'Michel', 'www.mobitours.com', 'Goma', 'DRC', 'Cosys.cd', '0811704141', 'software developer', 'abc2319yasm88'),
(2, 'michel', 'yann2013', 'user', 'misamuna@wwfcarpo.org', 'M', 'Isamuna', 'Michel', 'www.mobitours.com', 'Goma', 'DRC', 'Cosys.cd', '0811704141', 'software developer', 'nicor76hsh'),
(3, 'visitor', 'visitor0', 'user', 'misamuna@wwfcarpo.org', 'M', 'Isamuna', 'Michel', 'www.mobitours.com', 'Goma', 'DRC', 'Cosys.cd', '0811704141', 'software developer', 'yauie0746g');

-- --------------------------------------------------------

--
-- Table structure for table `zone_geo`
--

CREATE TABLE `zone_geo` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `zoneGeoId` int(11) NOT NULL,
  `nameZoneGeo` varchar(100) NOT NULL,
  `descZoneGeo` varchar(200) NOT NULL,
  `etenduZoneGeo` varchar(100) NOT NULL,
  `latzone` float(10,6) NOT NULL,
  `lngzone` float(10,6) NOT NULL,
  `areazone` float NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `zoneGeoId` (`zoneGeoId`),
  UNIQUE KEY `zoneGeoId_2` (`zoneGeoId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `zone_geo`
--

INSERT INTO `zone_geo` (`_id`, `zoneGeoId`, `nameZoneGeo`, `descZoneGeo`, `etenduZoneGeo`, `latzone`, `lngzone`, `areazone`) VALUES
(1, 1, 'Nord-Kivu', 'Au bord du lac kivu, a cote du volcan nyiragongo', '1245Km2', -1.654586, 29.220371, 0),
(2, 2, 'Sud-Kivu', 'Au bord du lac kivu, zone montagneuse', '1845Km2', -2.510259, 28.844948, 0),
(3, 3, 'Maniema', 'Ville enclaver entre le Sud-Kivu, Nord-kivu et Katanga et riche en minerais', '1845Km2', -2.948698, 25.950222, 0),
(4, 4, 'Kasai Oriental', 'au bord du lac kivu, a cote du volcan nyiragongo', '1845Km2', -2.751018, 23.389893, 0),
(5, 5, 'Kasai Occidental', 'au bord du lac kivu, a cote du volcan nyiragongo', '1845Km2', -5.123772, 21.851807, 0),
(6, 6, 'Bandundu', 'au bord du lac kivu, a cote du volcan nyiragongo', '1845Km2', -3.312077, 17.385521, 0),
(7, 7, 'Bas-Congo', 'au bord du lac kivu, a cote du volcan nyiragongo', '1845Km2', -5.848107, 13.056049, 0),
(8, 8, 'Equateur', 'au bord du lac kivu, a cote du volcan nyiragongo', '1845Km2', 0.049782, 18.255844, 0),
(9, 9, 'Kinshasa', 'au bord du lac kivu, a cote du volcan nyiragongo', '1845Km2', -4.318339, 15.314255, 0),
(10, 10, 'Province Orientale', 'au bord du lac kivu, a cote du volcan nyiragongo', '1845Km2', 0.520642, 25.196114, 0),
(11, 11, 'Katanga', 'au bord du lac kivu, a cote du volcan nyiragongo', '1845Km2', -11.649546, 27.479553, 0);
