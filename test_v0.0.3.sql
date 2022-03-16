-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2021 at 04:26 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `companyName` char(255) NOT NULL,
  `companyDescription` text DEFAULT NULL,
  `companyImage` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `companyName`, `companyDescription`, `companyImage`) VALUES
(1, 'AIMIL', 'AIMIL, a renowned name for Quality herbal health products in market established with aim of taking the legacy of Ayurveda ahead scientifically since 1984, is the leading health contributor to the society by Innovations- Developments- Manufacturing- Marketing and Promoting a broad range of ayurveda products in different dosage form indicated in several acute- sub-acute and chronic diseased conditions. Aimil have always endeavoured to bring revolutionary innovations in conceiving and developing concept of medication with breakthrough technologies and manufacturing them in GMP certified, utmost precious and automated unit, validating international quality specifications including ISO 9001:2008.Growing at a fast pace, aimil have strong strength of more than 2000 manpower with current turnover of value INR 3000 million approx. and have presence in India and in many parts across globe.', 'images/COMPANY/BANNER.jpg'),
(2, 'ALARSIN', 'In the year 1947, ALARSIN set up ‘Manthan’ its research division for developing research-based products in the light of ancient and modern medical knowledge. Manthan forms the back-bone of In-house R & D operations. Its main focus is on product quality and specialize in manufacturing of the select ethical ayurvedic specialty products. For Over 70 years now, Alarsin has developed itself as a renowned pharmaceutical company and its products are well established and accepted by medical practitioners and patients. On the occasion of the 1st Congress of SEAPALAR for the first time an Indian drug R.Compound – Alarsin was the subject of a Special Session before International Rheumatologists.Ayurvedic Drugs provided by ALARSIN are the perfect blend of effectiveness without any side effects. Alarsin have preserved the traditional art of manufacturing medicines & with the help of latest equipment and have merged it with modern manufacturing techniques to produce Ayurvedic formulations of superior quality.', 'images/COMPANY/BANNER.jpg'),
(3, 'CHARAK', 'The journey of Charak began in the year 1947 with a vision to improve the quality of life by making herbal healthcare available internationally.Charak endeavour is to meticulously research and formulate standardized products of the highest quality. Charak firmly believe that the customer is of paramount importance and therefore we place customer satisfaction as our supreme priority.Over the years, Charak has established itself as the foremost international herbal healthcare company, recognised as the bastion of customer well-being with top-quality products and services.\r\n', 'images/COMPANY/BANNER.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `countrycode` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL,
  `first_250_gm` double(8,2) DEFAULT 1287.78,
  `above_250_gm` double(8,2) DEFAULT 103.07
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `countrycode`, `name`, `phonecode`, `first_250_gm`, `above_250_gm`) VALUES
(1, 'AF', 'Afghanistan', 93, 13.05, 1.35),
(2, 'AL', 'Albania', 355, 15.39, 1.39),
(3, 'DZ', 'Algeria', 213, 15.39, 1.39),
(4, 'AS', 'American Samoa', 1684, 15.39, 1.39),
(5, 'AD', 'Andorra', 376, 15.39, 1.39),
(6, 'AO', 'Angola', 244, 15.39, 1.39),
(7, 'AI', 'Anguilla', 1264, 15.39, 1.39),
(8, 'AQ', 'Antarctica', 0, 15.39, 1.39),
(9, 'AG', 'Antigua And Barbuda', 1268, 15.39, 1.39),
(10, 'AR', 'Argentina', 54, 13.45, 2.15),
(11, 'AM', 'Armenia', 374, 15.39, 1.39),
(12, 'AW', 'Aruba', 297, 15.39, 1.39),
(13, 'AU', 'Australia', 61, 11.57, 1.48),
(14, 'AT', 'Austria', 43, 16.55, 0.94),
(15, 'AZ', 'Azerbaijan', 994, 15.39, 1.39),
(16, 'BS', 'Bahamas The', 1242, 15.39, 1.39),
(17, 'BH', 'Bahrain', 973, 16.68, 0.67),
(18, 'BD', 'Bangladesh', 880, 9.01, 0.67),
(19, 'BB', 'Barbados', 1246, 16.68, 3.63),
(20, 'BY', 'Belarus', 375, 17.62, 1.35),
(21, 'BE', 'Belgium', 32, 19.24, 1.08),
(22, 'BZ', 'Belize', 501, 15.39, 1.39),
(23, 'BJ', 'Benin', 229, 15.39, 1.39),
(24, 'BM', 'Bermuda', 1441, 14.12, 1.08),
(25, 'BT', 'Bhutan', 975, 12.24, 0.67),
(26, 'BO', 'Bolivia', 591, 15.39, 1.39),
(27, 'BA', 'Bosnia and Herzegovina', 387, 15.39, 1.39),
(28, 'BW', 'Botswana', 267, 17.62, 1.75),
(29, 'BV', 'Bouvet Island', 0, 15.39, 1.39),
(30, 'BR', 'Brazil', 55, 15.39, 1.39),
(31, 'IO', 'British Indian Ocean Territory', 246, 15.39, 1.39),
(32, 'BN', 'Brunei', 673, 10.09, 1.61),
(33, 'BG', 'Bulgaria', 359, 11.57, 0.94),
(34, 'BF', 'Burkina Faso', 226, 15.39, 1.39),
(35, 'BI', 'Burundi', 257, 15.39, 1.39),
(36, 'KH', 'Cambodia', 855, 9.15, 0.81),
(37, 'CM', 'Cameroon', 237, 15.39, 1.39),
(38, 'CA', 'Canada', 1, 15.87, 1.88),
(39, 'CV', 'Cape Verde', 238, 15.74, 2.02),
(40, 'KY', 'Cayman Islands', 1345, 15.39, 1.39),
(41, 'CF', 'Central African Republic', 236, 15.39, 1.39),
(42, 'TD', 'Chad', 235, 15.39, 1.39),
(43, 'CL', 'Chile', 56, 15.39, 1.39),
(44, 'CN', 'China', 86, 9.15, 0.81),
(45, 'CX', 'Christmas Island', 61, 15.39, 1.39),
(46, 'CC', 'Cocos (Keeling) Islands', 672, 15.39, 1.39),
(47, 'CO', 'Colombia', 57, 15.39, 1.39),
(48, 'KM', 'Comoros', 269, 15.39, 1.39),
(49, 'CG', 'Republic Of The Congo', 242, 15.39, 1.39),
(50, 'CD', 'Democratic Republic Of The Congo', 242, 17.62, 2.15),
(51, 'CK', 'Cook Islands', 682, 15.39, 1.39),
(52, 'CR', 'Costa Rica', 506, 15.39, 1.39),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', 225, 15.39, 1.39),
(54, 'HR', 'Croatia (Hrvatska)', 385, 15.39, 1.39),
(55, 'CU', 'Cuba', 53, 14.66, 1.88),
(56, 'CY', 'Cyprus', 357, 16.01, 1.48),
(57, 'CZ', 'Czech Republic', 420, 15.39, 1.39),
(58, 'DK', 'Denmark', 45, 23.41, 0.94),
(59, 'DJ', 'Djibouti', 253, 15.39, 1.39),
(60, 'DM', 'Dominica', 1767, 15.39, 1.39),
(61, 'DO', 'Dominican Republic', 1809, 15.39, 1.39),
(62, 'TP', 'East Timor', 670, 15.39, 1.39),
(63, 'EC', 'Ecuador', 593, 15.39, 1.39),
(64, 'EG', 'Egypt', 20, 13.86, 0.94),
(65, 'SV', 'El Salvador', 503, 16.41, 1.88),
(66, 'GQ', 'Equatorial Guinea', 240, 15.39, 1.39),
(67, 'ER', 'Eritrea', 291, 17.49, 1.48),
(68, 'EE', 'Estonia', 372, 15.60, 1.75),
(69, 'ET', 'Ethiopia', 251, 18.56, 1.35),
(70, 'XA', 'External Territories of Australia', 61, 15.39, 1.39),
(71, 'FK', 'Falkland Islands', 500, 15.39, 1.39),
(72, 'FO', 'Faroe Islands', 298, 15.39, 1.39),
(73, 'FJ', 'Fiji Islands', 679, 15.39, 1.39),
(74, 'FI', 'Finland', 358, 18.43, 1.08),
(75, 'FR', 'France', 33, 49.23, 4.57),
(76, 'GF', 'French Guiana', 594, 15.39, 1.39),
(77, 'PF', 'French Polynesia', 689, 15.39, 1.39),
(78, 'TF', 'French Southern Territories', 0, 15.39, 1.39),
(79, 'GA', 'Gabon', 241, 15.39, 1.39),
(80, 'GM', 'Gambia The', 220, 15.39, 1.39),
(81, 'GE', 'Georgia', 995, 17.22, 1.61),
(82, 'DE', 'Germany', 49, 17.49, 1.08),
(83, 'GH', 'Ghana', 233, 15.33, 1.75),
(84, 'GI', 'Gibraltar', 350, 15.39, 1.39),
(85, 'GR', 'Greece', 30, 16.95, 1.08),
(86, 'GL', 'Greenland', 299, 15.39, 1.39),
(87, 'GD', 'Grenada', 1473, 15.39, 1.39),
(88, 'GP', 'Guadeloupe', 590, 15.39, 1.39),
(89, 'GU', 'Guam', 1671, 15.39, 1.39),
(90, 'GT', 'Guatemala', 502, 15.39, 1.39),
(91, 'XU', 'Guernsey and Alderney', 44, 15.39, 1.39),
(92, 'GN', 'Guinea', 224, 15.39, 1.39),
(93, 'GW', 'Guinea-Bissau', 245, 15.39, 1.39),
(94, 'GY', 'Guyana', 592, 16.14, 3.77),
(95, 'HT', 'Haiti', 509, 15.39, 1.39),
(96, 'HM', 'Heard and McDonald Islands', 0, 15.39, 1.39),
(97, 'HN', 'Honduras', 504, 15.39, 1.39),
(98, 'HK', 'Hong Kong S.A.R.', 852, 15.39, 1.39),
(99, 'HU', 'Hungary', 36, 16.95, 1.08),
(100, 'IS', 'Iceland', 354, 22.73, 1.61),
(101, 'IN', 'India', 91, 15.39, 1.39),
(102, 'ID', 'Indonesia', 62, 10.63, 1.21),
(103, 'IR', 'Iran', 98, 15.20, 0.94),
(104, 'IQ', 'Iraq', 964, 11.16, 1.08),
(105, 'IE', 'Ireland', 353, 18.56, 1.08),
(106, 'IL', 'Israel', 972, 15.47, 1.08),
(107, 'IT', 'Italy', 39, 17.76, 0.94),
(108, 'JM', 'Jamaica', 1876, 15.39, 1.39),
(109, 'JP', 'Japan', 81, 12.24, 0.81),
(110, 'XJ', 'Jersey', 44, 15.39, 1.39),
(111, 'JO', 'Jordan', 962, 16.81, 0.81),
(112, 'KZ', 'Kazakhstan', 7, 15.39, 1.39),
(113, 'KE', 'Kenya', 254, 17.22, 1.21),
(114, 'KI', 'Kiribati', 686, 15.39, 1.39),
(115, 'KP', 'Korea North', 850, 15.39, 1.39),
(116, 'KR', 'Korea South', 82, 15.39, 1.39),
(117, 'KW', 'Kuwait', 965, 12.24, 0.67),
(118, 'KG', 'Kyrgyzstan', 996, 15.39, 1.39),
(119, 'LA', 'Laos', 856, 15.39, 1.39),
(120, 'LV', 'Latvia', 371, 13.18, 1.75),
(121, 'LB', 'Lebanon', 961, 15.39, 1.39),
(122, 'LS', 'Lesotho', 266, 15.39, 1.39),
(123, 'LR', 'Liberia', 231, 15.39, 1.39),
(124, 'LY', 'Libya', 218, 15.39, 1.39),
(125, 'LI', 'Liechtenstein', 423, 15.39, 1.39),
(126, 'LT', 'Lithuania', 370, 15.39, 1.39),
(127, 'LU', 'Luxembourg', 352, 15.47, 0.94),
(128, 'MO', 'Macau S.A.R.', 853, 15.39, 1.39),
(129, 'MK', 'Macedonia', 389, 15.39, 1.39),
(130, 'MG', 'Madagascar', 261, 15.39, 1.39),
(131, 'MW', 'Malawi', 265, 12.91, 1.48),
(132, 'MY', 'Malaysia', 60, 16.81, 0.81),
(133, 'MV', 'Maldives', 960, 9.15, 0.67),
(134, 'ML', 'Mali', 223, 15.39, 1.39),
(135, 'MT', 'Malta', 356, 15.39, 1.39),
(136, 'XM', 'Man (Isle of)', 44, 15.39, 1.39),
(137, 'MH', 'Marshall Islands', 692, 15.39, 1.39),
(138, 'MQ', 'Martinique', 596, 15.39, 1.39),
(139, 'MR', 'Mauritania', 222, 15.39, 1.39),
(140, 'MU', 'Mauritius', 230, 14.39, 1.48),
(141, 'YT', 'Mayotte', 269, 15.39, 1.39),
(142, 'MX', 'Mexico', 52, 14.80, 1.88),
(143, 'FM', 'Micronesia', 691, 15.39, 1.39),
(144, 'MD', 'Moldova', 373, 15.39, 1.39),
(145, 'MC', 'Monaco', 377, 15.39, 1.39),
(146, 'MN', 'Mongolia', 976, 14.26, 1.48),
(147, 'MS', 'Montserrat', 1664, 15.39, 1.39),
(148, 'MA', 'Morocco', 212, 18.97, 1.75),
(149, 'MZ', 'Mozambique', 258, 15.39, 1.39),
(150, 'MM', 'Myanmar', 95, 15.39, 1.39),
(151, 'NA', 'Namibia', 264, 11.70, 1.75),
(152, 'NR', 'Nauru', 674, 15.39, 1.39),
(153, 'NP', 'Nepal', 977, 9.01, 0.54),
(154, 'AN', 'Netherlands Antilles', 599, 15.39, 1.39),
(155, 'NL', 'Netherlands The', 31, 15.39, 1.39),
(156, 'NC', 'New Caledonia', 687, 15.39, 1.39),
(157, 'NZ', 'New Zealand', 64, 13.32, 1.61),
(158, 'NI', 'Nicaragua', 505, 15.39, 1.39),
(159, 'NE', 'Niger', 227, 14.53, 1.75),
(160, 'NG', 'Nigeria', 234, 15.33, 1.88),
(161, 'NU', 'Niue', 683, 15.39, 1.39),
(162, 'NF', 'Norfolk Island', 672, 15.39, 1.39),
(163, 'MP', 'Northern Mariana Islands', 1670, 15.39, 1.39),
(164, 'NO', 'Norway', 47, 25.69, 1.21),
(165, 'OM', 'Oman', 968, 16.68, 0.54),
(166, 'PK', 'Pakistan', 92, 10.90, 0.94),
(167, 'PW', 'Palau', 680, 15.39, 1.39),
(168, 'PS', 'Palestinian Territory Occupied', 970, 15.39, 1.39),
(169, 'PA', 'Panama', 507, 15.39, 1.39),
(170, 'PG', 'Papua new Guinea', 675, 19.37, 2.69),
(171, 'PY', 'Paraguay', 595, 15.39, 1.39),
(172, 'PE', 'Peru', 51, 15.39, 1.39),
(173, 'PH', 'Philippines', 63, 11.57, 0.94),
(174, 'PN', 'Pitcairn Island', 0, 15.39, 1.39),
(175, 'PL', 'Poland', 48, 13.86, 1.08),
(176, 'PT', 'Portugal', 351, 14.26, 1.21),
(177, 'PR', 'Puerto Rico', 1787, 15.39, 1.39),
(178, 'QA', 'Qatar', 974, 15.87, 0.67),
(179, 'RE', 'Reunion', 262, 15.39, 1.39),
(180, 'RO', 'Romania', 40, 18.43, 1.08),
(181, 'RU', 'Russia', 70, 17.62, 1.48),
(182, 'RW', 'Rwanda', 250, 12.78, 1.35),
(183, 'SH', 'Saint Helena', 290, 15.39, 1.39),
(184, 'KN', 'Saint Kitts And Nevis', 1869, 15.39, 1.39),
(185, 'LC', 'Saint Lucia', 1758, 15.39, 1.39),
(186, 'PM', 'Saint Pierre and Miquelon', 508, 15.39, 1.39),
(187, 'VC', 'Saint Vincent And The Grenadines', 1784, 15.39, 1.39),
(188, 'WS', 'Samoa', 684, 15.39, 1.39),
(189, 'SM', 'San Marino', 378, 15.39, 1.39),
(190, 'ST', 'Sao Tome and Principe', 239, 15.39, 1.39),
(191, 'SA', 'Saudi Arabia', 966, 13.72, 0.81),
(192, 'SN', 'Senegal', 221, 14.80, 1.75),
(193, 'RS', 'Serbia', 381, 15.39, 1.39),
(194, 'SC', 'Seychelles', 248, 15.39, 1.39),
(195, 'SL', 'Sierra Leone', 232, 15.39, 1.39),
(196, 'SG', 'Singapore', 65, 14.53, 0.81),
(197, 'SK', 'Slovakia', 421, 15.39, 1.39),
(198, 'SI', 'Slovenia', 386, 15.39, 1.39),
(199, 'XG', 'Smaller Territories of the UK', 44, 15.39, 1.39),
(200, 'SB', 'Solomon Islands', 677, 15.39, 1.39),
(201, 'SO', 'Somalia', 252, 15.39, 1.39),
(202, 'ZA', 'South Africa', 27, 15.07, 1.48),
(203, 'GS', 'South Georgia', 0, 15.39, 1.39),
(204, 'SS', 'South Sudan', 211, 15.39, 1.39),
(205, 'ES', 'Spain', 34, 14.12, 1.08),
(206, 'LK', 'Sri Lanka', 94, 10.63, 0.67),
(207, 'SD', 'Sudan', 249, 17.22, 1.61),
(208, 'SR', 'Suriname', 597, 15.39, 1.39),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', 47, 15.39, 1.39),
(210, 'SZ', 'Swaziland', 268, 15.39, 1.39),
(211, 'SE', 'Sweden', 46, 23.00, 1.08),
(212, 'CH', 'Switzerland', 41, 21.52, 1.08),
(213, 'SY', 'Syria', 963, 15.39, 1.39),
(214, 'TW', 'Taiwan', 886, 9.82, 1.08),
(215, 'TJ', 'Tajikistan', 992, 15.39, 1.39),
(216, 'TZ', 'Tanzania', 255, 14.26, 1.35),
(217, 'TH', 'Thailand', 66, 10.63, 0.81),
(218, 'TG', 'Togo', 228, 15.39, 1.39),
(219, 'TK', 'Tokelau', 690, 15.39, 1.39),
(220, 'TO', 'Tonga', 676, 15.39, 1.39),
(221, 'TT', 'Trinidad And Tobago', 1868, 15.39, 1.39),
(222, 'TN', 'Tunisia', 216, 15.87, 1.61),
(223, 'TR', 'Turkey', 90, 13.86, 1.08),
(224, 'TM', 'Turkmenistan', 7370, 15.39, 1.39),
(225, 'TC', 'Turks And Caicos Islands', 1649, 15.39, 1.39),
(226, 'TV', 'Tuvalu', 688, 15.39, 1.39),
(227, 'UG', 'Uganda', 256, 17.22, 1.21),
(228, 'UA', 'Ukraine', 380, 17.62, 1.75),
(229, 'AE', 'United Arab Emirates', 971, 16.68, 0.67),
(230, 'GB', 'United Kingdom', 44, 15.39, 1.39),
(231, 'US', 'United States', 1, 11.43, 2.02),
(232, 'UM', 'United States Minor Outlying Islands', 1, 15.39, 1.39),
(233, 'UY', 'Uruguay', 598, 15.39, 1.39),
(234, 'UZ', 'Uzbekistan', 998, 15.39, 1.39),
(235, 'VU', 'Vanuatu', 678, 15.39, 1.39),
(236, 'VA', 'Vatican City State (Holy See)', 39, 15.39, 1.39),
(237, 'VE', 'Venezuela', 58, 15.39, 1.39),
(238, 'VN', 'Vietnam', 84, 9.28, 0.94),
(239, 'VG', 'Virgin Islands (British)', 1284, 15.39, 1.39),
(240, 'VI', 'Virgin Islands (US)', 1340, 15.39, 1.39),
(241, 'WF', 'Wallis And Futuna Islands', 681, 15.39, 1.39),
(242, 'EH', 'Western Sahara', 212, 15.39, 1.39),
(243, 'YE', 'Yemen', 967, 9.82, 1.48),
(244, 'YU', 'Yugoslavia', 38, 15.39, 1.39),
(245, 'ZM', 'Zambia', 260, 15.39, 1.39),
(246, 'ZW', 'Zimbabwe', 263, 15.39, 1.39);

-- --------------------------------------------------------

--
-- Table structure for table `me_admin`
--

CREATE TABLE `me_admin` (
  `id` int(20) NOT NULL,
  `admin_name` varchar(30) DEFAULT NULL,
  `admin_email` varchar(70) NOT NULL,
  `admin_password` varchar(200) NOT NULL,
  `role` varchar(10) DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `me_admin`
--

INSERT INTO `me_admin` (`id`, `admin_name`, `admin_email`, `admin_password`, `role`) VALUES
(1, 'kalpesh jain', 'kalpeshjain1901@gmail.com', '$2b$10$yo3XqNYhCqAMYKiBBxo6yePVL4SOhcMUYYpsnNxXPrFDWu99F15MS', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `item_size` varchar(50) DEFAULT NULL,
  `item_cost` double(7,2) DEFAULT NULL,
  `item_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `item_name`, `item_size`, `item_cost`, `item_qty`) VALUES
(15, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(15, 'Amlycure D.S', 'Capsule', 250.00, 1),
(16, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(16, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(16, 'Amlycure Syrup', 'Syrup', 450.00, 1),
(17, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(17, 'Amlycure Syrup', 'Syrup', 450.00, 2),
(18, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(18, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(19, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(19, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(20, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(20, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(21, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(21, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(22, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(22, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(23, 'Amlycure D.S', 'Capsule', 250.00, 1),
(23, 'Ayush-Kwath', 'powder', 520.65, 1),
(24, 'Amlycure D.S', 'Capsule', 250.00, 1),
(24, 'Ayush-Kwath', 'powder', 520.65, 1),
(25, 'Amlycure D.S', 'Capsule', 250.00, 1),
(25, 'Ayush-Kwath', 'powder', 520.65, 1),
(26, 'Amalki tablet', 'Tablet', 120.36, 1),
(26, 'Arjin Tablet', 'Tablet', 95.00, 1),
(27, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(27, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(28, 'Ayapon Tablet', 'Tablet', 105.00, 2),
(29, 'Ayush-Kwath', 'powder', 520.65, 1),
(29, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(30, 'Ayush-Kwath', 'powder', 520.65, 1),
(30, 'Amalki tablet', 'Tablet', 120.36, 4),
(30, 'Arjin Tablet', 'Tablet', 95.00, 1),
(31, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(31, 'Aloes Compound', '50 Tablet', 150.46, 1),
(32, 'Aloes Compound', '100 Tablet', 199.00, 4),
(33, 'Aloes Compound', '50 Tablet', 150.46, 1),
(34, 'Amlycure D.S', 'Capsule', 250.00, 1),
(34, 'Amalki tablet', 'Tablet', 120.36, 1),
(34, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(35, 'Aloes Compound', '50 Tablet', 150.46, 5),
(35, 'Arjin Tablet', 'Tablet', 95.00, 1),
(35, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(36, 'Arjin Tablet', 'Tablet', 95.00, 2),
(36, 'Ayush-Kwath', 'powder', 520.65, 1),
(36, 'Amlycure Syrup', 'Syrup', 450.00, 1),
(36, 'Aloes Compound', '50 Tablet', 150.46, 1),
(36, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(37, 'Ayush-Kwath', 'powder', 520.65, 2),
(37, 'Amlycure Syrup', 'Syrup', 450.00, 1),
(38, 'Amalki tablet', 'Tablet', 120.36, 2),
(38, 'Arjin Tablet', 'Tablet', 95.00, 2),
(40, 'Amlycure D.S', 'Capsule', 250.00, 1),
(40, 'Ayush-Kwath', 'powder', 520.65, 1),
(40, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(42, 'Amlycure Syrup', 'Syrup', 450.00, 1),
(43, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(43, 'Amlycure Syrup', 'Syrup', 450.00, 1),
(44, 'Amlycure D.S', 'Capsule', 250.00, 1),
(45, 'Amlycure Syrup', 'Syrup', 450.00, 1),
(45, 'Amlycure D.S', 'Capsule', 250.00, 1),
(46, 'Arjin Tablet', 'Tablet', 95.00, 1),
(47, 'Aloes Compound', '50 Tablet', 150.46, 1),
(48, 'Aloes Compound', '50 Tablet', 150.46, 1),
(49, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(50, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(51, 'Addyzoa capsule', 'Capsule', 50.69, 2),
(51, 'ALURETIC Tablet', 'Tablet', 80.96, 2),
(52, 'Amlycure D.S', 'Capsule', 250.00, 1),
(53, 'Arjin Tablet', 'Tablet', 95.00, 1),
(53, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(53, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(54, 'Amlycure D.S', 'Capsule', 250.00, 1),
(55, 'Addyzoa capsule', 'Capsule', 50.69, 2),
(56, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(57, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(58, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(58, 'Amlycure Syrup', 'Syrup', 450.00, 1),
(59, 'Amalki tablet', 'Tablet', 120.36, 1),
(60, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(61, 'Ayush-Kwath', 'powder', 520.65, 1),
(62, 'Aloes Compound', '50 Tablet', 150.46, 2),
(62, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(63, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(63, 'Amalki tablet', 'Tablet', 120.36, 1),
(64, 'Amlycure D.S', 'Capsule', 250.00, 1),
(64, 'Aloes Compound', '50 Tablet', 150.46, 1),
(64, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(65, 'Amalki tablet', 'Tablet', 120.36, 5),
(65, 'Aloes Compound', '50 Tablet', 150.46, 1),
(65, 'Ayapon Tablet', 'Tablet', 105.00, 1),
(66, 'Ayush-Kwath', 'powder', 520.65, 7),
(66, 'Amalki tablet', 'Tablet', 120.36, 4),
(66, 'Amlycure Syrup', 'Syrup', 450.00, 1),
(66, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(67, 'Amalki tablet', 'Tablet', 120.36, 1),
(67, 'Ayush-Kwath', 'powder', 520.65, 1),
(68, 'Amlycure D.S', 'Capsule', 250.00, 1),
(69, 'Amalki tablet', 'Tablet', 120.36, 1),
(69, 'Ayush-Kwath', 'powder', 520.65, 1),
(70, 'Aloes Compound', '50 Tablet', 150.46, 1),
(70, 'Ayush-Kwath', 'powder', 520.65, 1),
(71, 'Ayush-Kwath', 'powder', 520.65, 6),
(72, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(73, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(73, 'ALURETIC Tablet', 'Tablet', 80.96, 1),
(74, 'Aloes Compound', '50 Tablet', 150.46, 1),
(74, 'Amlycure D.S', 'Capsule', 250.00, 1),
(74, 'Amalki tablet', 'Tablet', 120.36, 1),
(74, 'Ayush-Kwath', 'powder', 520.65, 1),
(75, 'Amlycure D.S', 'Syrup', 300.00, 3),
(76, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(77, 'Amalki tablet', 'Tablet', 120.36, 1),
(77, 'Amlycure Syrup', 'Syrup', 450.00, 1),
(77, 'Arjin Tablet', 'Tablet', 95.00, 1),
(78, 'Amalki tablet', 'Tablet', 120.36, 1),
(78, 'Arjin Tablet', 'Tablet', 95.00, 1),
(79, 'Amlycure D.S', 'Syrup', 300.00, 4),
(79, 'Arjin Tablet', 'Tablet', 95.00, 3),
(79, 'Amalki tablet', 'Tablet', 120.36, 1),
(80, 'Ayush-Kwath', 'powder', 520.65, 6),
(80, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(81, 'ALURETIC Tablet', 'Tablet', 80.96, 2),
(81, 'Aloes Compound', '50 Tablet', 150.46, 2),
(82, 'Ayush-Kwath', 'powder', 520.65, 2),
(82, 'ALURETIC Tablet', 'Tablet', 80.96, 2),
(83, 'Amalki tablet', 'Tablet', 120.36, 1),
(83, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(84, 'Amlycure Syrup', 'Syrup', 450.00, 1),
(84, 'Addyzoa capsule', 'Capsule', 50.69, 1),
(85, 'Amalki tablet', 'Tablet', 120.36, 6),
(85, 'Addyzoa capsule', 'Capsule', 50.69, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(5) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` varchar(1000) DEFAULT NULL,
  `product_indication` varchar(1000) DEFAULT NULL,
  `product_ingredient` varchar(1000) DEFAULT NULL,
  `product_dosage` varchar(1000) DEFAULT NULL,
  `product_company_id` int(5) DEFAULT NULL,
  `product_img` varchar(100) DEFAULT '/COMPANY/BANNER.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_indication`, `product_ingredient`, `product_dosage`, `product_company_id`, `product_img`) VALUES
(1, 'Ayush-Kwath', 'Aimil AYUSH kawth is a comprehensive formula enriched with scientifically validated highest quality botanicals herbs such as Tulsi, Sunthi, Dalchini, kali Mirch, in its purest form.        \r\n\r\n                                       The formulation is recommended by AYUSH doctors contributes in the enhancement & maintenance of quality of life by helping build strong immunity & fighting harmful viruses & bacteria.', 'Immunity enhancer Cough & cold As an adjuvant in upper respiratory tract infections Or as directed by the physician', '--', '3 gm twice daily or as direction of use, 2 tabs twice daily with water', 1, '/images/AIMIL/AIMIL-AYUSH-KWATH.png'),
(2, 'Amalki tablet', 'Vital herbs incorporated in Amalki (Ayurvedic medicine for hyper-acidity and peptic ulcer) reduce the frequency and intensity of the hyperacidity or heartburn or reflux esophagitis by maintaining the gastric acid secretions and neutralising gastric secretions, toning digestive system and metabolism of food so that further recurrence of hyperacidity can be reduced significantly.Phytonutrients in Amalki, acting synergistically and comprehensively at the root cause level of peptic ulcer. Amalki inhibits the growth of Helicobacter pylori and reduces increased gastric acid secretion, which is main cause for peptic ulcer. ', 'Chronic hyperacidity Reflux oesophagitis Dyspepsia Flatulence Heart burn and associated acid peptic disorders.', ' Lehsun (Allium sativum L.), Pippali (Piper longum)', 'Adults : 2 tabs. thrice a day, Children : 1 tab. twice a day, Preventive & Follow up : Adults : 2 tabs twice a day', 1, '/images/AIMIL/AMALKI-TABLET.jpg'),
(3, 'Amlycure D.S', 'Amlycure DS the Liver Care in Desired Strength from AIMIL, comprising of poly-herbal ingredients potent enough to correct & protect the liver from diseases and disorders due to different causes. Amlycure DS contains several of the well documented and time tested herbs like Kalmegh, Kutaki, Nagarmotha, Raktrohida, Sharpunkha, Brinjasif, Parpatr, Nishoth, Punernava, Kalmegh, Giloe, Tulsi, Sharpunkha, Kutaki etc and certain classical formulations proven for restoring the normalancy in Liver functions & cellular integrity disturbed during diseased phase. Amlycure DS benefits with synergism of 32 ingredients in syrup and 29 ingredients in capsules providing drug concentration of 5485 mg/10 ml in syrup and 4840mg/ capsule which makes Amlycure DS more efficacious & medicine of choice.', '--', 'Bhringraj (Eclipta alba, Amla, Arjuna, Baheda, Daruharidra, Chitrak, Mooli,Punernava , Haritaki, Guduchi, Makoya, Yavakshar, Ajwain, Dhania, Ashwagandha, Manjistha, Kalmegh , Tulsi, Kasni, Revand chini, Ghrit Kumari, Pittapapada, Patha, Vidanga / Vavding , Kachur , Yashtimadhu, Jhau , Kutaki , Bhui ', 'Adults: Capsule:  1 – 2 capsules thrice a day Syrup: 2 – 3 teaspoonful thrice a day Children: Syrup:½ –  1 teaspoonful twice a day', 1, '/images/AIMIL/AMLYCURE DS SYRUP.jpg'),
(4, 'Amlycure Syrup', 'Amlycure is a comprehensive polyherbal formula, in potent concentration of different vital herbs. \r\nIt exerts corrective & protective effect in order to check progression, severity of liver diorders and effectively restore liver functional parameters. Amlycure helps to restore the liver functioning by providing multidimensional approach by showing anti-viral, anti-oxidant, anti-inflammatory, immuno-modulator, choleratic and anti-cholestatic activity.\r\nAmlycure is completely safe.', '--', '--', 'Syrup Infants : 3-5 drops twice a day. Children : ½ to 1 tsf twice a day. Adults : 2-3 tsf 3-4 times a day.', 1, '/images/AIMIL/AMLYCURE SYRUP.jpg'),
(5, 'Aloes Compound', 'Aloes Compound is a clinically tested, non-hormonal medicine that helps to regulate menstrual cycles, stimulate ovulation and promote overall menstrual health. This 70 year old ayurvedic formulation offers benefits for menstrual issues such as period cramps, irregular or scanty periods, delayed puberty, infertility and in counteracting the side-effects of contraceptive pills.$$\r\nIn comparison to most herbal products, Aloes Compound is not a physical mixture of ayurvedic ingredients but an ayurvedic formulation of 7 ingredients, each in a specific proportion, based on their benefits and efficacy.$$ The product is convenient, has no side-effects and is safe for use by teenagers, young adults and unmarried women, where intrusive pelvic examinations and hormonal treatment may not be possible or desirable.', '--', 'Aloe Indica,Hirabol,Jivanti,Manjistha,Kamboji,Hurmal,Kasis', 'Dosage for Irregular and Scanty Menses, Amenorrhea (absence of menstrual periods) or Delayed Menarche(late event in puberty) :$$ 2 tablets twice or thrice a day for 3-4 months. $$(Discontinue when pregnancy is indicated). $$ Dosage for counteracting withdrawal side-effects of contraceptive pill: $$ 2 tablets twice or thrice a day (a course of 100 to 200 tablets) $$ To be repeated as required. $$ Dosage for Dysmenorrhea (painful menstruation, typically involving abdominal cramps): $$ 2 tablets thrice a day from 3 to 5 days before the expected date of menses till periods begin and pain subsides. To be repeated for 3-4 menstrual cycles. $$ Dosage for improving fertility and ovulatory stability when pattern and flow are normal: $$ 2 tablets twice a day, starting from 1st day of the menstrual cycle to the 14th day. To be repeated till pregnancy indicated.', 2, '/images/ALARSIN/aloes.jpg'),
(6, 'ALURETIC Tablet', 'Ensures sustained diuresis. $$ Onset of diuresis within one hour of administering first dose of 1-2 tabs. This diuretic effect lasts for 5-6 hours. $$ Increases output of urine without causing strain or adverse effect on kidneys. $$ Does not cause bio-chemical, hematological or renal abnormality. $$ Improves function of Kidneys, Heart, Liver & Lungs. $$ Regulates urine elimination & excretory functions. $$ Helps to reduce weight significantly. $$ It is safe in pregnancy.', 'OEDEMA : Mild to Moderate $$ Renal : Insufficiency, Malfunction, Nephritis $$ Cardiac: Mild to moderate High B.P., congestive heart failure $$ Pulmonary congestion $$ Oedema : postural, anaemic $$ Routine Use: Idiopathic Oedema, late middle & old age when kidney function is diminished. $$ For short term reduction of intraocular pressure, particularly pre-operative and post-operative.', 'Guduchi Ghan, Suddha Shilajit, Suddha Guggul, Punarnava, Gokshura, Ikshu Mool, Haldi Daruharida, Suntha, Haritaki, JeshtiMadha, Anantamul, Saunf, Deodar, Bharangi Mul, Kala-kadu, Patola, Nirgundi, Nim Pan, Amala, Pashanbheda, Dusparsha, ErandaMul, Vidanga, Apamarga, Sahianjan, KavachMul, Shankapushpi.', '1-2 tablets at a time. Maximum 6 tabs. in 24 hours in divided doses. Last dose not to be given late in the evening particularly during initiation of treatment. (Interval between two doses is to be adjusted as per individual requirements).', 2, '/images/ALARSIN/Aluretic-3-800x800.jpg'),
(7, 'Arjin Tablet', 'Arjin is a proven combination of herbo-mineral drugs clinically tested and used since centuries in Cardio-vascular disorders, having diuretic, hypotensive, Liver corrective, sedative, anti-spasmodic, antiarrhythmic, carminative, laxative and anti-obesity properties. $$ Helps to rectify various factors of mild to moderate BP. $$ Arjin aims to correct the impaired Cardiac, Renal & Liver (Hepatic) Parenchyma function. $$ It improves the tone of Cardio-vascular system and calms the nervous system. $$ Significantly reduces cholesterol levels.', 'Hypertension (essential). $$ High B.P. associated with symptoms like giddiness, loss of concentration, sleeplessness etc. $$ Palpitation of heart. $$ Neuro circulatory Asthenia. $$ Angina pectoris associated with hypertension. $$ As a normotensive therapy after hypertension is controlled.', 'Jatamansi, Malkangi, Suddha Shilajit, Arjun Chhal, Brahmi, Sarapagandha, Trifala, Punarnava, Vachha, Apamarga, Upersari, Kadu White, Kadu Black, Bel Mool, Shatavari, Harde, Guduchi, Bhangara, Tarbuj Beej, Nishotar, Rasna, Guggul, Tunkana Khar, Shora Khar, Gokharu, Sunth, Dash Mool, Amala, Kariyattu, Pitpapara, Rvand Chini, Ganthoda, Khurasani Ajvayan, Pashanbhed.', '2 tablets three or four times a day to begin with. Once the B.P. is controlled and symptoms are relieved, dosage can be adjusted accordingly: 2 tablets once or twice a day', 2, '/images/ALARSIN/Arjin-3-800x800.jpg'),
(8, 'Ayapon Tablet', 'In General and Dental practice: Immediate use of Ayapon is effective, practically convenient and safe to the patient and physician. $$ In Dysfunctional Uterine Bleeding controls bleeding,restores normal uterine functions & rhythm of menstrual cycle. $$ Non-toxic, non-hormonal, No contra-indications. $$ Can be safely recommended in all age groups. $$ No withdrawal bleeding. No thromboembolic phenomenon or migraine. $$ No danger of carcinoma even in prolonged use. $$ Can be used as a preventive therapy before surgery or tooth extraction', 'Capillary haemorrhages in any part of the body: Bleeding gums, Piles, Epistaxis, Purpura, Haematemesis, Haemoptysis: 2 tabs three times a day till bleeding is controlled. Then as and when required. $$ Dysfunctional Uterine Bleeding: Menorrhagia, Metrorrhagia, Metropathiahaemorrhagica, Pubertal and Menopausal bleeding etc.: 2 tabs three or four times a day till bleeding is controlled. $$ Then 2 tabs twice a day for 3 months to restore normal rhythm of menstrual cycle. $$ Post-abortion, puerperal and D & C Bleeding: 2 tabs. thrice a day from the day loop is inserted for two weeks. Then 2 tabs twice a day for 1-2 months.\r\n$$ Bleeding after loop (IUCD) insertion: 2 tabs thrice a day from the day loop is inserted for two weeks. Then 2 tabs twice a day starting 5 days before the expected date of menstruation and continue during menses. Treatment to be repeated for 2-3 cycles.', 'Jeevanti, Kamboji, Ayapan, Ashok Chhal, Nagkesar, Godanti Bhasma.', 'Capillary haemorrhages in any part of the body: Bleeding gums, Piles, Epistaxis, Purpura, Haematemesis, Haemoptysis: 2 tabs three times a day till bleeding is controlled. Then as and when required. $$ Dysfunctional Uterine Bleeding: Menorrhagia, Metrorrhagia, Metropathiahaemorrhagica, Pubertal and Menopausal bleeding etc.: 2 tabs three or four times a day till bleeding is controlled. $$ Then 2 tabs twice a day for 3 months to restore normal rhythm of menstrual cycle. $$ Post-abortion, puerperal and D & C Bleeding: 2 tabs. thrice a day from the day loop is inserted for two weeks. Then 2 tabs twice a day for 1-2 months.', 2, '/images/ALARSIN/Ayapon-800x800.jpg'),
(9, 'Addyzoa capsule', 'Male infertility is the inability of male partner to cause pregnancy in female having fertile reproductive system. Sperm count, morphology and motility are major causes of male infertility. ADDYZOA supports the healthy formation of sperm, sperm motility, shape and size of sperm and also add to semen density. It is a herbomineral spermatogenic antioxidant which reduces excessive oxidative stress at the cellular level responsible for sperm damage. Guduchi (Tinospora cordifolia) and Amalaki (Emblica officinalis) are potent antioxidants in ADDYZOA. ADDYZOA supports spermatogenesis (the process of sperm formation) by maintaining the functions of male reproductive organs and improving the male hormonal levels. The ingredients like Kapikachchhu (Mucuna pruriens) and Ashwagandha (Withania somnifera) are useful to boost overall stamina as well.', '--', 'Amalaki,ashwagandha,giloy,kapikachuchhu,shatavari', '1-2 capsules twice daily or as advised by the physician $$ (we recommend you to consult the physician for correct dosage to suit your condition)', 3, '/images/CHARAK/ADDYZOA-CAP.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_pkg`
--

CREATE TABLE `product_pkg` (
  `product_pkg_id` int(5) NOT NULL,
  `product_size` varchar(40) DEFAULT NULL,
  `product_weight_gram` double(8,3) DEFAULT NULL,
  `product_price` double(7,2) DEFAULT NULL,
  `product_unquie_id` int(6) DEFAULT NULL,
  `parent_product_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_pkg`
--

INSERT INTO `product_pkg` (`product_pkg_id`, `product_size`, `product_weight_gram`, `product_price`, `product_unquie_id`, `parent_product_id`) VALUES
(1, 'powder', 250.500, 520.65, 2556, 1),
(2, 'Tablet', 100.500, 230.78, 2557, 1),
(3, 'Tablet', 100.200, 120.36, 2558, 2),
(4, 'Capsule', 100.250, 250.00, 2559, 3),
(5, 'Syrup', 100.200, 300.00, 2560, 3),
(6, 'Syrup', 100.240, 450.00, 2561, 4),
(7, '50 Tablet', 80.000, 150.46, 2562, 5),
(8, '100 Tablet', 125.600, 199.00, 2563, 5),
(9, '1000 Tablet', 400.250, 1500.00, 2564, 5),
(10, 'Tablet', 50.320, 80.96, 2565, 6),
(11, 'Tablet', 50.320, 95.00, 2566, 7),
(12, 'Tablet', 50.320, 105.00, 2567, 8),
(13, 'Capsule', 20.360, 50.69, 2568, 9);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `e_mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `mobile_no` varchar(12) DEFAULT NULL,
  `address` text NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) NOT NULL,
  `role` varchar(10) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `e_mail`, `password`, `user_name`, `mobile_no`, `address`, `country`, `state`, `city`, `zip`, `role`) VALUES
(1, 'kalpeshjain19101@gmail.com', '$2b$10$nozjQPJ.he9H5CUpSmmc5ehOgItiJHVSRs0K5Ha.HHfea1FjnhnVq', 'kalpesh Jain', '8422796587', 'A3,415,Kamala park CHSL,:opposite navrang hotel Bhayander(west)', 'Zimbabwe', 'Midlands', 'Zvishavane', '410101', 'user'),
(2, 'prachir2122@gmail.com', '$2b$10$lxtBXpKxJfXE1GXBMz3yI.u0pwBxa9VmtoedDhUmc9fxy7ukq20cC', 'Prachi jain', '8544796588', 'A3,415,Kamala park CHSL,:opposite navrang hotel Bhayander(west)', 'Zimbabwe', 'Midlands', 'Zvishavane', '854785', 'user'),
(3, 'Chin@pra', '$2b$10$B/X2esp7P2ORFvYqjhti9eF89H1jrY4Jt4qAVBO6Ybfs1655LB3KO', 'Prachin Ranawat', '8466352715', 'A3,415,Kamala park CHSL,:opposite navrang hotel Bhayander(west)', '1 Afghanistan', 'Example', 'city123', '401108', 'user'),
(4, 'chetna12@23', '$2b$10$F.z57iqDs3qZlvxkrL7rXuL8566pzE0QnPr6LPDD2luk9j8m6Dv9y', 'chetna jAIN', '8454952563', 'A3,415,Kamala park CHSL,:opposite navrang hotel Bhayander(west)', 'Algeria', 'Example', 'Bhayander', '401101', 'user'),
(5, 'priyeshb@gmail.com', '$2b$10$lZBGGZjkBPY9.tkhzcrjbOD6o6kbVPVKddhHefuSdHaXtuLc/hwma', 'Priyesh Bagna', '7488596857', 'A3,415,Kamala park CHSL,(WASE):jfsjfsj', 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', '401101', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_mobile` varchar(12) DEFAULT NULL,
  `order_amount` varchar(20) DEFAULT NULL,
  `status` varchar(15) DEFAULT 'Pending',
  `purchaseTime` datetime DEFAULT current_timestamp(),
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`order_id`, `user_id`, `shipping_address`, `user_email`, `user_mobile`, `order_amount`, `status`, `purchaseTime`, `country`, `state`, `city`, `zipcode`) VALUES
(1, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '182.34', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(2, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '499.80', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(3, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '150.46', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(4, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '450.00', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(5, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '520.65', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(6, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '571.34', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(7, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '641.01', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(8, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '691.70', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(9, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '326.42', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(10, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '675.36', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(11, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '400.46', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(12, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '635.96', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(13, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '850.46', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(14, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '651.15', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(15, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '300.69', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(16, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '605.69', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(17, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'prachir212@gmail.com', '8422796587', '1005.00', 'Preparing', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(18, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '155.69', 'Dispatched', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(19, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '155.69', 'Dispatched', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(20, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '155.69', 'Delivered', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(21, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '155.69', 'Dispatched', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(22, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '155.69', 'Preparing', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(23, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '770.65', 'Delivered', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(24, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '770.65', 'Preparing', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(25, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '770.65', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(26, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '215.36', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(27, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '155.69', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(28, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '210.00', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(29, 4, 'A3,415,Kamala park CHSL,(WASE);opposite navrang hotel Bhayander(west)', 'vek@gmail.com', '8455796584', '625.65', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(30, 4, 'Mumbai to goa;goa to mumbai', 'ris@gmail.com', '8422571526', '1097.09', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(31, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '201.15', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(32, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '796.00', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(33, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '150.46', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(34, 1, '4;jfsjfsj', 'chetna12@23', '7455896321', '451.32', 'Pending', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(35, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '928.26', 'Preparing', '2021-04-23 03:44:20', NULL, NULL, NULL, NULL),
(36, 5, 'A3,415,Kamala park CHSL,(WASE);opposite navrang hotel Bhayander(west)', 'priyeshb@gmail.com', '8544796588', '1392.07', 'Delivered', NULL, 'Algeria', 'Mumbai', 'Mumbai', '401102'),
(37, 5, 'A3,415,Kamala park CHSL,(WASE);jfsjfsj', 'priyeshb@gmail.com', '7488596857', '1491.30', 'Preparing', NULL, 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', ''),
(38, 5, 'A3,415,Kamala park CHSL,(WASE);jfsjfsj', 'priyeshb@gmail.com', '7488596857', '430.72', 'Pending', NULL, 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', ''),
(39, 5, 'A3,415,Kamala park CHSL,(WASE);jfsjfsj', 'priyeshb@gmail.com', '7488596857', '0', 'Pending', NULL, 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', ''),
(40, 5, 'A3,415,Kamala park CHSL,(WASE);jfsjfsj', 'priyeshb@gmail.com', '7488596857', '875.65', 'Pending', NULL, 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', ''),
(41, 5, 'A3,415,Kamala park CHSL,(WASE);jfsjfsj', 'priyeshb@gmail.com', '7488596857', '0', 'Pending', NULL, 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', ''),
(42, 5, 'A3,415,Kamala park CHSL,(WASE);jfsjfsj', 'priyeshb@gmail.com', '7488596857', '450.00', 'Pending', NULL, 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', ''),
(43, 5, 'A3,415,Kamala park CHSL,(WASE);jfsjfsj', 'priyeshb@gmail.com', '7488596857', '530.96', 'Pending', NULL, 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', ''),
(44, 5, 'A3,415,Kamala park CHSL,(WASE);jfsjfsj', 'priyeshb@gmail.com', '7488596857', '250.00', 'Pending', NULL, 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', ''),
(45, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '700.00', 'Pending', '2021-06-07 12:40:24', 'Algeria', 'Example', 'Bhayander', ''),
(46, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '95.00', 'Pending', '2021-06-07 12:44:14', 'Algeria', 'Example', 'Bhayander', NULL),
(47, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '150.46', 'Pending', '2021-06-07 12:47:16', 'Algeria', 'Example', 'Bhayander', NULL),
(48, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '150.46', 'Pending', '2021-06-07 12:48:04', 'Algeria', 'Example', 'Bhayander', ''),
(49, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '105.00', 'Pending', '2021-06-07 12:50:13', 'Algeria', 'Example', 'Bhayander', '401101'),
(50, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '80.96', 'Pending', '2021-06-07 13:40:04', 'Algeria', 'Example', 'Bhayander', '401101'),
(51, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '263.30', 'Pending', '2021-06-07 18:12:05', 'Algeria', 'Example', 'Bhayander', '401101'),
(52, 4, 'undefined;undefined', NULL, NULL, '250.00', 'Pending', '2021-06-07 18:38:15', NULL, NULL, NULL, NULL),
(53, 4, 'undefined;undefined', NULL, NULL, '226.65', 'Pending', '2021-06-07 18:43:52', NULL, NULL, NULL, NULL),
(54, 4, 'undefined;undefined', NULL, NULL, '250.00', 'Pending', '2021-06-07 18:52:20', NULL, NULL, NULL, NULL),
(55, 4, 'undefined;undefined', NULL, NULL, '101.38', 'Pending', '2021-06-07 19:09:08', NULL, NULL, NULL, NULL),
(56, 4, 'undefined;undefined', NULL, NULL, '80.96', 'Pending', '2021-06-07 19:10:33', NULL, NULL, NULL, NULL),
(57, 4, 'undefined;undefined', NULL, NULL, '80.96', 'Pending', '2021-06-07 19:11:31', NULL, NULL, NULL, NULL),
(58, 4, 'undefined;undefined', NULL, NULL, '530.96', 'Pending', '2021-06-07 19:20:03', NULL, NULL, NULL, NULL),
(59, 4, 'undefined;undefined', NULL, NULL, '120.36', 'Pending', '2021-06-07 19:29:28', NULL, NULL, NULL, NULL),
(60, 4, 'undefined;undefined', NULL, NULL, '105.00', 'Pending', '2021-06-07 19:32:22', NULL, NULL, NULL, NULL),
(61, 5, 'A3,415,Kamala park CHSL,(WASE);jfsjfsj', 'priyeshb@gmail.com', '7488596857', '520.65', 'Pending', '2021-06-08 11:05:25', 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', '401101'),
(62, 5, 'A3,415,Kamala park CHSL,(WASE);jfsjfsj', 'priyeshb@gmail.com', '7488596857', '381.88', 'Pending', '2021-06-09 12:59:43', 'Afghanistan', 'JJDGNJGNJ', 'Bhayander', '401101'),
(63, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '225.36', 'Pending', '2021-06-09 18:00:26', 'Algeria', 'Example', 'Bhayander', '401101'),
(64, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '451.15', 'Pending', '2021-06-10 00:50:13', 'Algeria', 'Example', 'Bhayander', '401101'),
(65, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '857.26', 'Pending', '2021-06-10 00:51:42', 'Algeria', 'Example', 'Bhayander', '401101'),
(66, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '4656.95', 'Pending', '2021-06-10 01:07:01', 'Algeria', 'Example', 'Bhayander', '401101'),
(67, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '641.01', 'Pending', '2021-06-10 01:15:17', 'Algeria', 'Example', 'Bhayander', '401101'),
(68, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '250.00', 'Pending', '2021-06-10 01:24:16', 'Algeria', 'Example', 'Bhayander', '401101'),
(69, 4, 'A/478, Dr.Babasaheb Ambedkar Road;Komola Plaza', 'sdCfsSd@gmail.com', '8455796584', '641.01', 'Pending', '2021-06-10 01:48:40', 'Antigua And Barbuda', 'Argentenia', 'Romania', '857965'),
(70, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '671.11', 'Pending', '2021-06-10 12:05:24', 'Algeria', 'Example', 'Bhayander', '401101'),
(71, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '3123.90', 'Pending', '2021-06-10 21:35:39', 'Algeria', 'Example', 'Bhayander', '401101'),
(72, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '80.96', 'Pending', '2021-06-11 04:51:08', 'Algeria', 'Example', 'Bhayander', '401101'),
(73, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '1419.43', 'Pending', '2021-06-11 04:53:38', 'Algeria', 'Example', 'Bhayander', '401101'),
(74, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8422796587', '2445.080066', 'Pending', '2021-06-11 05:28:22', 'United States', 'fjndjfndj', 'Bhayander', '401102'),
(75, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '2208.6413679999996', 'Pending', '2021-06-11 13:44:10', 'Algeria', 'Example', 'Bhayander', '401101'),
(76, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '1338.47', 'Pending', '2021-06-11 15:38:18', 'Algeria', 'Example', 'Bhayander', '401101'),
(77, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '1953.4533327999998', 'Pending', '2021-06-11 16:22:43', 'Algeria', 'Example', 'Bhayander', '401101'),
(78, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '1503.1399999999999', 'Pending', '2021-06-11 17:29:21', 'Algeria', 'Example', 'Bhayander', '401101'),
(79, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '3058.8600687999997', 'Delivered', '2021-06-13 13:08:43', 'Algeria', 'Example', 'Bhayander', '401101'),
(80, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '4987.35', 'Pending', '2021-06-24 14:20:29', 'Algeria', 'Example', 'Bhayander', '401101'),
(81, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '1853.69', 'Pending', '2021-06-24 15:57:31', 'Algeria', 'Example', 'Bhayander', '401101'),
(82, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8422796587', '2897.62', 'Pending', '2021-06-24 17:04:29', 'Finland', 'fjndjfndj', 'Bhayander', '55'),
(83, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '1458.83', 'Pending', '2021-06-24 20:50:37', 'Algeria', 'Example', 'Bhayander', '401101'),
(84, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '516.08', 'Pending', '2021-06-24 23:49:10', 'Algeria', 'Example', 'Bhayander', '401101'),
(85, 4, 'A3,415,Kamala park CHSL,;opposite navrang hotel Bhayander(west)', 'chetna12@23', '8454952563', '791.02', 'Pending', '2021-07-03 17:34:16', 'Algeria', 'Example', 'Bhayander', '401101');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companyName` (`companyName`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `me_admin`
--
ALTER TABLE `me_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_email` (`admin_email`),
  ADD UNIQUE KEY `admin_name` (`admin_name`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_name` (`product_name`),
  ADD KEY `product_company_id` (`product_company_id`);

--
-- Indexes for table `product_pkg`
--
ALTER TABLE `product_pkg`
  ADD PRIMARY KEY (`product_pkg_id`),
  ADD KEY `product_pkg_ibfk_1` (`parent_product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `e_mail` (`e_mail`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `me_admin`
--
ALTER TABLE `me_admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_pkg`
--
ALTER TABLE `product_pkg`
  MODIFY `product_pkg_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `user_orders` (`order_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `product_pkg`
--
ALTER TABLE `product_pkg`
  ADD CONSTRAINT `product_pkg_ibfk_1` FOREIGN KEY (`parent_product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
