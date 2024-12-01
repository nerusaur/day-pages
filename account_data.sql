-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2024 at 03:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `account_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_table`
--

CREATE TABLE `account_table` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_table`
--

INSERT INTO `account_table` (`ID`, `Name`, `Email`, `Password`) VALUES
(8, 'Neil Sindayen', 'n@gmail.com', 'n'),
(9, 'Dennis Soliman', 'dj27@gmail.com', '$2y$10$xvjXaZCwgYeIJWLblGVIOeSvs1pWzoNWX9dh0q313pnn3mj8WM8bK'),
(10, 'Jose Rizal', 'jrizal@g.com', '$2y$10$Ou4n6m2vnJ1ENXjvJo5pYOozfjSF0SycvvCEA12wS1RdELCGeTrA.'),
(11, 'Neil Sindayen', 'Sindayen_neil@g.com', '$2y$10$uRiPM6CVFf1zj4hyONSXH.4WLVkifV53ndFwDgBNelYbS3IXLMyMG'),
(12, 'Shiro Salta', 'shirosalta@g.com', '$2y$10$uuXmf2Ij4fOatSCUIQzVzufKS0TaDxEiL7oAQ1ngpdTUZ/0QxwQ0a'),
(13, 'Shiro Salta', 'salta@g.com', '$2y$10$j8lrIt./lnUE.X0hkti/YuXXW3zGHJ4sLZapFAZ5rOIEXc4D8ZUHe'),
(14, 'Shiro Salta', 'Shiro@g.com', '$2y$10$/6tYYqq2oPTDT/XvSOae0eYL6JmkLMwYBYsyirH3uiGQWFlXS3WMu'),
(15, 'try', 'try@g.com', '$2y$10$iyn4u7MevkCEfASKq3aBRu/rjbYQNk3JsGA07r.XBb8VHabeHa4gS'),
(16, 'Dom Salta', 'Dom@g.com', '$2y$10$7qteEJziLqUYlzL45JnQteazRwH4CbuqLo.H/TNMzJ2NHNoQ/PNu2'),
(17, 'Neil Sindayen', 'neilsindayen@gmail.com', '$2y$10$06SA1U23/49z7bNFWPbPgemEq5GSo5u1EuOZW2Cax5dp9lH3Wg.iy'),
(18, 'Final ', 'final@g.com', '$2y$10$Kra3y0WPEIbE2d/dAExsL.SPhXxThjlQHwCqij4ZatJzbE/tXYiv2'),
(19, 'TEST', 'test@gmail.com', '$2y$10$GuELvOKDvPI5Q1fFltec1OedLBtyJofijkU0oeVfSqNd0VM3jk6tW');

-- --------------------------------------------------------

--
-- Table structure for table `diary_entriess`
--

CREATE TABLE `diary_entriess` (
  `id` int(11) NOT NULL,
  `entry_title` varchar(255) NOT NULL,
  `date_string` varchar(50) NOT NULL,
  `image_html` varchar(255) DEFAULT NULL,
  `entry_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `mood` varchar(255) NOT NULL,
  `gratitude` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diary_entriess`
--

INSERT INTO `diary_entriess` (`id`, `entry_title`, `date_string`, `image_html`, `entry_text`, `created_at`, `user_id`, `mood`, `gratitude`) VALUES
(2, 'last month', '23 October 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', '1', '2024-10-27 12:33:27', 8, 'Angry', ''),
(3, '1', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', '1', '2024-11-23 12:49:04', 0, '', ''),
(4, '1', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', '1', '2024-11-23 12:52:26', 0, '', ''),
(5, 'asd', '23 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 'asd', '2024-11-23 12:55:07', 0, '', ''),
(6, '1', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', '1', '2024-11-23 13:06:08', 0, '', ''),
(7, '1', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', '1', '2024-11-23 13:40:25', 0, '', ''),
(10, 'Title', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', 'Dear Diary', '2024-11-23 13:58:18', 8, '', ''),
(11, 'This is me', '23 November 2024', '', 'submitEntrysubmitEntrysubmitEntrysubmitEntrysubmitEntrysubmitEntrysubmitEntry', '2024-11-23 14:34:34', 8, '', ''),
(12, 'kaw at ikaw', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', 'Prinsesa', '2024-11-23 14:56:36', 8, '', ''),
(13, '1', '23 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', '1', '2024-11-23 15:02:20', 8, '', ''),
(14, '1', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', '1', '2024-11-23 15:03:11', 8, '', ''),
(15, 'displaySavedEntry', '23 November 2024', '', 'displaySavedEntry', '2024-11-23 15:07:40', 8, '', ''),
(16, 'asd', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', 'asd', '2024-11-23 15:20:10', 8, '', ''),
(17, 'sike', '23 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 'sike&lt;div id=&quot;entryResultRow&quot; style=&quot;max-width: 800px; margin: auto;&quot;&gt;&lt;/div&gt;', '2024-11-23 15:20:46', 8, '', ''),
(18, 'asd', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', 'asd', '2024-11-23 15:26:08', 8, '', ''),
(19, 'I cant', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', 'Pls help!', '2024-11-23 15:30:24', 8, '', ''),
(20, '1', '23 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', '11', '2024-11-23 15:31:47', 8, '', ''),
(21, '1', '24 November 2024', '', '1', '2024-11-24 05:39:48', 9, '', ''),
(22, '1', '24 November 2024', '', '1', '2024-11-24 05:39:58', 9, '', ''),
(23, 'q', '24 November 2024', '', 'q', '2024-11-24 05:40:02', 9, '', ''),
(24, 'e', '24 November 2024', '', 'e', '2024-11-24 05:40:11', 9, '', ''),
(25, 'asd', '24 November 2024', '', 'asd', '2024-11-24 05:40:14', 9, '', ''),
(26, 'asd', '24 November 2024', '', 'asd', '2024-11-24 05:40:18', 9, '', ''),
(27, 'asd', '24 November 2024', '', 'asd', '2024-11-24 05:40:21', 9, '', ''),
(28, 'asd', '24 November 2024', '', 'asdasd', '2024-11-24 05:40:24', 9, '', ''),
(29, 'asda', '24 November 2024', '', 'asdas', '2024-11-24 05:40:27', 9, '', ''),
(30, 'asd', '24 November 2024', '', 'asdas', '2024-11-24 05:40:30', 9, '', ''),
(31, 'asda', '24 November 2024', '', 'asdas', '2024-11-24 05:40:34', 9, '', ''),
(32, 'asd', '24 November 2024', '', 'asd', '2024-11-24 05:40:41', 9, '', ''),
(33, 'asd', '24 November 2024', '', 'asd', '2024-11-24 05:40:44', 9, '', ''),
(34, 'asd', '24 November 2024', '', 'asd', '2024-11-24 05:40:47', 9, '', ''),
(35, 'asd', '24 November 2024', '', 'asd', '2024-11-24 05:40:50', 9, '', ''),
(36, 'asd', '24 November 2024', '', 'asd', '2024-11-24 06:22:07', 9, '', ''),
(37, 'Jose Rizal', '24 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', 'J Rizal', '2024-11-24 06:44:58', 10, '', ''),
(38, 'asd', '24 November 2024', '', 'asd', '2024-11-24 06:45:42', 10, '', ''),
(39, 's', '24 November 2024', '', 's', '2024-11-24 06:46:12', 10, '', ''),
(42, 'Dennis', '24 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 'Soliman', '2024-11-24 08:00:06', 9, '', ''),
(43, 'add', '24 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 'add add', '2024-11-24 08:46:32', 11, '', ''),
(44, 'Dear Shiro Salta', '24 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 'Si Shiro Salta na raw bahala magpakain sa mga panels natin sa defense &lt;3', '2024-11-24 08:48:01', 11, '', ''),
(45, 'Dennis Soliman', '24 November 2024', '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#039;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2024-11-24 14:15:30', 8, '', ''),
(46, 'asd', '24 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 'asd', '2024-11-24 14:24:57', 9, '', ''),
(47, 'f', '24 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 'f', '2024-11-24 14:36:16', 8, '', ''),
(48, 'Case Defense', '25 November 2024', '&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQA', 'I think singko ako???? YESS???', '2024-11-25 03:15:43', 13, '', ''),
(49, 'new', '25 November 2024', '', '&lt;select id=&quot;mood-selector-filter&quot; class=&quot;mood-dropdown-filter&quot;&gt;\n                  &lt;option value=&quot;&quot; disabled selected&gt;Filter&lt;/option&gt;\n                  &lt;option value=&quot;Happy&quot;&gt;Happy 😊&lt;/option&gt;\n                  &lt;option value=&quot;Relaxed&quot;&gt;Relaxed 😌&lt;/option&gt;\n                  &lt;option value=&quot;Focused&quot;&gt;Focused 🎯&lt;/option&gt;\n                  &lt;option value=&quot;Excited&quot;&gt;Excited 😄&lt;/option&gt;\n                  &lt;option value=&quot;Calm&quot;&gt;Calm 🌊&lt;/option&gt;\n                  &lt;option value=&quot;Sad&quot;&gt;Sad 😢&lt;/option&gt;\n                  &lt;option value=&quot;Anxious&quot;&gt;Anxious 😰&lt;/option&gt;\n                  &lt;option value=&quot;Angry&quot;&gt;Angry 😠&lt;/option&gt;\n                  &lt;option value=&quot;Content&quot;&gt;Content 😊&lt;/option&gt;\n                  &lt;option value=&quot;Energetic&quot;&gt;Energetic ⚡&lt;/option&gt;\n                  &lt;option value=&quot;Date&quot;&gt;By Date&lt;/option&gt;\n                  &lt;option value=&quot;None&quot;&gt;None&lt;/option&gt;\n                &lt;/select&gt;', '2024-11-25 05:36:12', 8, '', ''),
(50, 'asd', '25 November 2024', '', 'asd', '2024-11-25 05:38:29', 8, '', ''),
(51, 'try', '25 November 2024', '', 'Try', '2024-11-25 05:43:17', 8, '', ''),
(52, 's', '25 November 2024', '', 'ss', '2024-11-25 05:46:36', 8, '', ''),
(53, 's', '25 November 2024', '', 's', '2024-11-25 05:50:23', 9, '', ''),
(54, 's', '25 November 2024', '', 'sss', '2024-11-25 05:52:11', 9, '', ''),
(55, '1', '25 November 2024', '', '1', '2024-11-25 05:57:14', 9, '', ''),
(56, '2', '25 November 2024', '', '2', '2024-11-25 05:57:42', 9, '', ''),
(57, '3', '25 November 2024', '', '3', '2024-11-25 05:59:04', 9, '', ''),
(58, '4', '25 November 2024', '', '4', '2024-11-25 06:01:49', 9, '', ''),
(59, '1', '25 November 2024', '', '1', '2024-11-25 06:09:15', 9, '', ''),
(60, 'Case Study', '25 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 'I think singko ako??? YHESSS', '2024-11-25 06:49:42', 14, '', ''),
(61, 'asd', '25 November 2024', '', 'asd', '2024-11-25 09:40:06', 8, '', ''),
(62, 'wow grape', '25 November 2024', '', 'grape', '2024-11-25 09:41:34', 8, '', ''),
(63, 'wow', '25 November 2024', '', 'grape', '2024-11-25 09:42:03', 8, '', ''),
(64, 'with mood', '25 November 2024', '', 'pls gumana kana!!!', '2024-11-25 09:51:23', 8, 'Happy', ''),
(65, 'asd', '25 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 'Soliasd', '2024-11-25 11:46:00', 8, 'Happy', ''),
(66, 'asd', '25 November 2024', '', 'asdasd', '2024-11-25 11:53:54', 8, 'Relaxed', ''),
(67, 'asd', '25 November 2024', '', 'asd', '2024-11-25 12:12:02', 8, 'Relaxed', ''),
(68, 'new', '25 November 2024', '', 'bago', '2024-11-25 12:31:46', 8, 'Relaxed', ''),
(69, 'Dennis 27', '25 November 2024', '', 'document.addEventListener(&#039;DOMContentLoaded&#039;, fetchEntries);', '2024-11-25 12:38:33', 8, 'Relaxed', ''),
(70, 's', '25 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 's', '2024-11-25 12:43:30', 8, 'Happy', ''),
(71, 's', '25 November 2024', '', 's', '2024-11-25 12:47:58', 9, 'Relaxed', ''),
(72, 'salta', '25 November 2024', '', 'labul', '2024-11-25 12:51:16', 9, 'Excited', ''),
(73, 'zzzzzzzzzzz', '25 November 2024', '', 'zz', '2024-11-25 12:53:44', 9, 'Happy', ''),
(74, '3', '25 November 2024', '', '3', '2024-11-25 12:56:35', 9, 'Happy', ''),
(75, 'ew', '25 November 2024', '&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhE', 'ew entry', '2024-11-25 13:03:54', 8, 'Happy', ''),
(76, 'Dear Dominic', '25 November 2024', '', 'I think singko ako sa finals YESSS???', '2024-11-25 13:16:48', 9, 'Happy', ''),
(77, 'Dear Dominic', '25 November 2024', '', 'Singko', '2024-11-25 13:20:00', 9, 'Happy', ''),
(78, 'singko', '25 November 2024', '', 'Dear Dominic', '2024-11-25 13:20:26', 9, 'Happy', ''),
(79, 's', '25 November 2024', '', 'ss', '2024-11-25 13:21:09', 9, 'Happy', ''),
(80, '11', '25 November 2024', '', '11', '2024-11-25 13:23:44', 9, 'Happy', ''),
(81, '32', '25 November 2024', '', 's32', '2024-11-25 13:26:01', 9, 'Happy', ''),
(82, 's', '25 November 2024', '', 's', '2024-11-25 13:38:59', 9, 'Happy', ''),
(83, 'dadadadan', '25 November 2024', '', 'da', '2024-11-25 13:40:05', 9, 'Sad', ''),
(84, 'b', '25 November 2024', '', 'nb', '2024-11-25 14:19:26', 9, 'Happy', ''),
(85, 's', '25 November 2024', '', 's', '2024-11-25 14:22:52', 9, 'Happy', ''),
(86, 's', '25 November 2024', '', 's', '2024-11-25 14:23:30', 9, 'Happy', ''),
(87, 'n', '25 November 2024', '', 'n', '2024-11-25 14:29:30', 9, 'Happy', ''),
(88, 'asd', '26 November 2024', '', 'tru', '2024-11-26 11:06:33', 8, 'Happy', ''),
(89, 'uzi', '26 November 2024', '', 'lock in ako bukas', '2024-11-26 14:09:30', 9, 'Happy', ''),
(90, 'new', '27 November 2024', '', 'new', '2024-11-27 03:27:33', 9, 'Happy', ''),
(91, '1', '2024-11-27', NULL, '1', '2024-11-27 12:47:31', 9, '', ''),
(92, '1', '2024-11-27', NULL, '1', '2024-11-27 12:48:08', 9, '', ''),
(93, 'Hanns Soliman', '2024-11-27', NULL, 'Plss gumana ', '2024-11-27 12:48:49', 9, '', ''),
(94, 'Hanns Soliman', '2024-11-27', NULL, 'Plss gumana ', '2024-11-27 12:51:41', 9, '', ''),
(95, 'with mood again ', '2024-11-27', NULL, 'with mood ', '2024-11-27 12:54:28', 9, 'Energetic', ''),
(96, 'with mood again ', '2024-11-27', NULL, 'with mood ', '2024-11-27 12:55:14', 9, 'Energetic', ''),
(97, 'with mood', '2024-11-27', NULL, 'with pic', '2024-11-27 12:56:43', 9, 'Relaxed', ''),
(98, '1', '2024-11-27', NULL, '1', '2024-11-27 12:57:36', 9, 'Happy', ''),
(99, '1', '2024-11-27', NULL, '1', '2024-11-27 12:57:40', 9, 'Happy', ''),
(100, 'PCITYRE ', '2024-11-27', NULL, 'not null image', '2024-11-27 13:01:38', 9, 'Happy', ''),
(101, 'PCITYRE ', '2024-11-27', NULL, 'not null image', '2024-11-27 13:02:49', 9, 'Happy', ''),
(102, 'PCITYRE ', '2024-11-27', NULL, 'not null image', '2024-11-27 13:02:55', 9, 'Happy', ''),
(103, 'blob', '2024-11-27', NULL, 'blob data type', '2024-11-27 13:34:23', 9, 'Happy', ''),
(104, 'once', '2024-11-27', NULL, 'once', '2024-11-27 13:41:28', 9, 'Energetic', ''),
(105, 'twice', '2024-11-27', NULL, '2', '2024-11-27 13:41:43', 9, 'Focused', ''),
(106, '1', '2024-11-27', NULL, '1', '2024-11-27 13:52:28', 9, 'Happy', ''),
(107, 's', '2024-11-27', NULL, 's', '2024-11-27 13:57:31', 9, 'Relaxed', ''),
(108, '1', '2024-11-27', NULL, '1', '2024-11-27 13:57:40', 9, 'Relaxed', ''),
(109, 'with picture', '2024-11-27', NULL, 'image path', '2024-11-27 13:58:01', 9, 'Happy', ''),
(110, 's', '2024-11-27', NULL, 's', '2024-11-27 14:53:36', 9, 'Happy', ''),
(111, 's', '2024-11-27', NULL, 's', '2024-11-27 14:54:19', 9, 'Happy', ''),
(112, '1', '2024-11-27', NULL, '1', '2024-11-27 14:54:28', 9, 'Happy', ''),
(113, '1', '2024-11-27', NULL, '1', '2024-11-27 14:56:19', 9, 'Happy', ''),
(114, '1', '2024-11-27', NULL, '1', '2024-11-27 14:56:24', 9, 'Focused', ''),
(115, '1', '2024-11-27', NULL, '1', '2024-11-27 14:56:29', 9, 'Focused', ''),
(116, '1', '2024-11-27', NULL, '1', '2024-11-27 14:57:41', 9, 'Focused', ''),
(117, 'c', '2024-11-27', NULL, 'c', '2024-11-27 15:05:04', 9, 'Content', ''),
(118, 'c', '2024-11-27', NULL, 'c', '2024-11-27 15:05:29', 9, 'Content', ''),
(119, 'c', '2024-11-27', NULL, 'c', '2024-11-27 15:05:32', 9, 'Content', ''),
(120, 'c', '2024-11-27', NULL, 'c', '2024-11-27 15:10:43', 9, '0', ''),
(121, 's', '2024-11-27', NULL, 's', '2024-11-27 15:10:48', 9, '0', ''),
(122, 'add', '2024-11-27', NULL, 'add', '2024-11-27 15:11:51', 9, '0', ''),
(123, '2', '2024-11-27', NULL, '2', '2024-11-27 15:12:17', 9, '0', ''),
(124, 'if', '2024-11-27', NULL, 'added', '2024-11-27 15:14:14', 9, '0', ''),
(125, 'Dennis', '2024-11-27', NULL, 'Soliuman', '2024-11-27 15:15:14', 9, '0', ''),
(126, 's', '2024-11-27', NULL, 's', '2024-11-27 15:17:31', 9, '0', ''),
(127, 's', '2024-11-27', NULL, 's', '2024-11-27 15:18:03', 9, '0', ''),
(128, 's', '2024-11-27', NULL, 's', '2024-11-27 15:18:41', 9, '0', ''),
(129, 's', '2024-11-27', NULL, 'image', '2024-11-27 15:18:56', 9, '0', ''),
(130, '', '2024-11-27', NULL, '', '2024-11-27 15:22:58', 9, '0', ''),
(131, 's', '2024-11-27', NULL, 's', '2024-11-27 15:33:27', 9, 'Focused', ''),
(132, 's', '2024-11-27', NULL, 's', '2024-11-27 15:33:31', 9, 'Happy', ''),
(133, '1', '2024-11-27', NULL, '1', '2024-11-27 15:35:26', 9, 'Relaxed', ''),
(134, 'fetcg', '2024-11-27', NULL, 'fetch all', '2024-11-27 15:36:53', 9, 'Excited', ''),
(135, 'fetcg', '2024-11-27', NULL, 'fetch all', '2024-11-27 15:38:18', 9, 'Excited', ''),
(136, 's', '2024-11-27', NULL, 's', '2024-11-27 15:38:22', 9, 'Sad', ''),
(137, 's', '2024-11-27', NULL, 's', '2024-11-27 15:38:33', 9, 'Relaxed', ''),
(138, 's', '2024-11-28', NULL, 's', '2024-11-28 13:16:27', 8, 'Angry', ''),
(139, '', '2024-11-28', NULL, '', '2024-11-28 13:17:03', 8, '', ''),
(140, 's', '2024-11-28', NULL, 's', '2024-11-28 13:17:37', 8, 'Happy', ''),
(141, '', '2024-11-28', NULL, '', '2024-11-28 13:17:46', 8, '', ''),
(142, 'ssss', '2024-11-28', NULL, 'dddssssssss', '2024-11-28 14:20:33', 9, 'Relaxed', ''),
(143, 'ssss', '2024-11-28', NULL, 'dddssssssss', '2024-11-28 14:21:40', 9, 'Relaxed', ''),
(144, 'ssss', '2024-11-28', NULL, 'dddssssssss', '2024-11-28 14:21:52', 9, 'Relaxed', ''),
(145, 's', '2024-11-28', NULL, 's', '2024-11-28 14:28:43', 9, 'Happy', ''),
(146, 's', '2024-11-28', NULL, 's', '2024-11-28 14:34:31', 9, 'Happy', ''),
(147, 's', '2024-11-28', NULL, 's', '2024-11-28 14:36:40', 9, 'Happy', ''),
(148, 's', '2024-11-28', NULL, 's', '2024-11-28 14:36:42', 9, 'Happy', ''),
(149, 's', '2024-11-30', NULL, 's', '2024-11-29 23:39:34', 9, 'Relaxed', ''),
(150, 's', '2024-11-30', NULL, 's', '2024-11-30 00:23:28', 9, 'Relaxed', ''),
(151, 's', '2024-11-30', NULL, 's', '2024-11-30 00:45:49', 9, 'Relaxed', ''),
(152, 's', '2024-11-30', NULL, 's', '2024-11-30 00:45:55', 9, 'Relaxed', ''),
(153, 's', '2024-11-30', NULL, 's', '2024-11-30 00:47:31', 9, 'Relaxed', ''),
(154, 's', '2024-11-30', NULL, 's', '2024-11-30 00:48:08', 9, 'Relaxed', ''),
(155, 's', '2024-11-30', NULL, 's', '2024-11-30 00:48:35', 9, 'Relaxed', ''),
(156, 'x', '2024-11-30', NULL, 'x', '2024-11-30 01:19:03', 9, 'Relaxed', ''),
(157, 'x', '2024-11-30', NULL, 'x', '2024-11-30 01:23:24', 9, 'Relaxed', ''),
(158, 'Dennis', '2024-11-30', NULL, 'Doggy ni Dennis', '2024-11-30 04:07:57', 9, 'Happy', ''),
(159, 's', '2024-11-30', NULL, ' // Create the delete button\\r\\n  const deleteButton = document.createElement(\\\'button\\\'); // Create the delete button\\r\\n  const deleteButton = document.createElement(\\\'button\\\');\\r\\n  deleteButton.textContent = \\\'Delete\\\';\\r\\n  deleteButton.className = \\\'delete-btn\\\';\\r\\n  deleteButton.style.position = \\\'absolute\\\';\\r\\n  deleteButton.style.top = \\\'10px\\\';\\r\\n  deleteButton.style.right = \\\'10px\\\';\\r\\n  deleteButton.style.display = \\\'none\\\'; // Hide initially\\r\\n  deleteButton.style.backgroundColor = \\\'#f44336\\\';\\r\\n  deleteButton.style.color = \\\'#fff\\\';\\r\\n  deleteButton.style.border = \\\'none\\\';\\r\\n  deleteButton.style.padding = \\\'5px 10px\\\';\\r\\n  deleteButton.style.cursor = \\\'pointer\\\';\\r\\n  deleteButton.style.borderRadius = \\\'5px\\\';\\r\\n  deleteButton.textContent = \\\'Delete\\\';\\r\\n  deleteButton.className = \\\'delete-btn\\\';\\r\\n  deleteButton.style.position = \\\'absolute\\\';\\r\\n  deleteButton.style.top = \\\'10px\\\';\\r\\n  deleteButton.style.right = \\\'10px\\\';\\r\\n  deleteButton.style.display = \\\'none\\\'; // Hide initially\\r\\n  deleteButton.style.backgroundColor = \\\'#f44336\\\';\\r\\n  deleteButton.style.color = \\\'#fff\\\';\\r\\n  deleteButton.style.border = \\\'none\\\';\\r\\n  deleteButton.style.padding = \\\'5px 10px\\\';\\r\\n  deleteButton.style.cursor = \\\'pointer\\\';\\r\\n  deleteButton.style.borderRadius = \\\'5px\\\';', '2024-11-30 04:22:15', 8, 'Happy', ''),
(160, 's', '2024-11-30', NULL, ' // Create the delete button\\r\\n  const deleteButton = document.createElement(\\\'button\\\'); // Create the delete button\\r\\n  const deleteButton = document.createElement(\\\'button\\\');\\r\\n  deleteButton.textContent = \\\'Delete\\\';\\r\\n  deleteButton.className = \\\'delete-btn\\\';\\r\\n  deleteButton.style.position = \\\'absolute\\\';\\r\\n  deleteButton.style.top = \\\'10px\\\';\\r\\n  deleteButton.style.right = \\\'10px\\\';\\r\\n  deleteButton.style.display = \\\'none\\\'; // Hide initially\\r\\n  deleteButton.style.backgroundColor = \\\'#f44336\\\';\\r\\n  deleteButton.style.color = \\\'#fff\\\';\\r\\n  deleteButton.style.border = \\\'none\\\';\\r\\n  deleteButton.style.padding = \\\'5px 10px\\\';\\r\\n  deleteButton.style.cursor = \\\'pointer\\\';\\r\\n  deleteButton.style.borderRadius = \\\'5px\\\';\\r\\n  deleteButton.textContent = \\\'Delete\\\';\\r\\n  deleteButton.className = \\\'delete-btn\\\';\\r\\n  deleteButton.style.position = \\\'absolute\\\';\\r\\n  deleteButton.style.top = \\\'10px\\\';\\r\\n  deleteButton.style.right = \\\'10px\\\';\\r\\n  deleteButton.style.display = \\\'none\\\'; // Hide initially\\r\\n  deleteButton.style.backgroundColor = \\\'#f44336\\\';\\r\\n  deleteButton.style.color = \\\'#fff\\\';\\r\\n  deleteButton.style.border = \\\'none\\\';\\r\\n  deleteButton.style.padding = \\\'5px 10px\\\';\\r\\n  deleteButton.style.cursor = \\\'pointer\\\';\\r\\n  deleteButton.style.borderRadius = \\\'5px\\\';', '2024-11-30 05:55:01', 8, 'Happy', ''),
(161, 's', '2024-11-30', NULL, ' // Create the delete button\\r\\n  const deleteButton = document.createElement(\\\'button\\\'); // Create the delete button\\r\\n  const deleteButton = document.createElement(\\\'button\\\');\\r\\n  deleteButton.textContent = \\\'Delete\\\';\\r\\n  deleteButton.className = \\\'delete-btn\\\';\\r\\n  deleteButton.style.position = \\\'absolute\\\';\\r\\n  deleteButton.style.top = \\\'10px\\\';\\r\\n  deleteButton.style.right = \\\'10px\\\';\\r\\n  deleteButton.style.display = \\\'none\\\'; // Hide initially\\r\\n  deleteButton.style.backgroundColor = \\\'#f44336\\\';\\r\\n  deleteButton.style.color = \\\'#fff\\\';\\r\\n  deleteButton.style.border = \\\'none\\\';\\r\\n  deleteButton.style.padding = \\\'5px 10px\\\';\\r\\n  deleteButton.style.cursor = \\\'pointer\\\';\\r\\n  deleteButton.style.borderRadius = \\\'5px\\\';\\r\\n  deleteButton.textContent = \\\'Delete\\\';\\r\\n  deleteButton.className = \\\'delete-btn\\\';\\r\\n  deleteButton.style.position = \\\'absolute\\\';\\r\\n  deleteButton.style.top = \\\'10px\\\';\\r\\n  deleteButton.style.right = \\\'10px\\\';\\r\\n  deleteButton.style.display = \\\'none\\\'; // Hide initially\\r\\n  deleteButton.style.backgroundColor = \\\'#f44336\\\';\\r\\n  deleteButton.style.color = \\\'#fff\\\';\\r\\n  deleteButton.style.border = \\\'none\\\';\\r\\n  deleteButton.style.padding = \\\'5px 10px\\\';\\r\\n  deleteButton.style.cursor = \\\'pointer\\\';\\r\\n  deleteButton.style.borderRadius = \\\'5px\\\';', '2024-11-30 05:55:37', 8, 'Happy', ''),
(162, 's', '2024-11-30', NULL, ' // Create the delete button\\r\\n  const deleteButton = document.createElement(\\\'button\\\'); // Create the delete button\\r\\n  const deleteButton = document.createElement(\\\'button\\\');\\r\\n  deleteButton.textContent = \\\'Delete\\\';\\r\\n  deleteButton.className = \\\'delete-btn\\\';\\r\\n  deleteButton.style.position = \\\'absolute\\\';\\r\\n  deleteButton.style.top = \\\'10px\\\';\\r\\n  deleteButton.style.right = \\\'10px\\\';\\r\\n  deleteButton.style.display = \\\'none\\\'; // Hide initially\\r\\n  deleteButton.style.backgroundColor = \\\'#f44336\\\';\\r\\n  deleteButton.style.color = \\\'#fff\\\';\\r\\n  deleteButton.style.border = \\\'none\\\';\\r\\n  deleteButton.style.padding = \\\'5px 10px\\\';\\r\\n  deleteButton.style.cursor = \\\'pointer\\\';\\r\\n  deleteButton.style.borderRadius = \\\'5px\\\';\\r\\n  deleteButton.textContent = \\\'Delete\\\';\\r\\n  deleteButton.className = \\\'delete-btn\\\';\\r\\n  deleteButton.style.position = \\\'absolute\\\';\\r\\n  deleteButton.style.top = \\\'10px\\\';\\r\\n  deleteButton.style.right = \\\'10px\\\';\\r\\n  deleteButton.style.display = \\\'none\\\'; // Hide initially\\r\\n  deleteButton.style.backgroundColor = \\\'#f44336\\\';\\r\\n  deleteButton.style.color = \\\'#fff\\\';\\r\\n  deleteButton.style.border = \\\'none\\\';\\r\\n  deleteButton.style.padding = \\\'5px 10px\\\';\\r\\n  deleteButton.style.cursor = \\\'pointer\\\';\\r\\n  deleteButton.style.borderRadius = \\\'5px\\\';', '2024-11-30 05:56:14', 8, 'Happy', ''),
(163, 's', '2024-11-30', NULL, ' // Create the delete button\\r\\n  const deleteButton = document.createElement(\\\'button\\\'); // Create the delete button\\r\\n  const deleteButton = document.createElement(\\\'button\\\');\\r\\n  deleteButton.textContent = \\\'Delete\\\';\\r\\n  deleteButton.className = \\\'delete-btn\\\';\\r\\n  deleteButton.style.position = \\\'absolute\\\';\\r\\n  deleteButton.style.top = \\\'10px\\\';\\r\\n  deleteButton.style.right = \\\'10px\\\';\\r\\n  deleteButton.style.display = \\\'none\\\'; // Hide initially\\r\\n  deleteButton.style.backgroundColor = \\\'#f44336\\\';\\r\\n  deleteButton.style.color = \\\'#fff\\\';\\r\\n  deleteButton.style.border = \\\'none\\\';\\r\\n  deleteButton.style.padding = \\\'5px 10px\\\';\\r\\n  deleteButton.style.cursor = \\\'pointer\\\';\\r\\n  deleteButton.style.borderRadius = \\\'5px\\\';\\r\\n  deleteButton.textContent = \\\'Delete\\\';\\r\\n  deleteButton.className = \\\'delete-btn\\\';\\r\\n  deleteButton.style.position = \\\'absolute\\\';\\r\\n  deleteButton.style.top = \\\'10px\\\';\\r\\n  deleteButton.style.right = \\\'10px\\\';\\r\\n  deleteButton.style.display = \\\'none\\\'; // Hide initially\\r\\n  deleteButton.style.backgroundColor = \\\'#f44336\\\';\\r\\n  deleteButton.style.color = \\\'#fff\\\';\\r\\n  deleteButton.style.border = \\\'none\\\';\\r\\n  deleteButton.style.padding = \\\'5px 10px\\\';\\r\\n  deleteButton.style.cursor = \\\'pointer\\\';\\r\\n  deleteButton.style.borderRadius = \\\'5px\\\';', '2024-11-30 05:57:07', 8, 'Happy', ''),
(164, 's', '2024-11-30', NULL, 's', '2024-11-30 05:57:12', 8, 'Happy', ''),
(165, 's', '2024-11-30', NULL, 's', '2024-11-30 05:57:30', 8, 'Happy', ''),
(166, 's', '2024-11-30', NULL, 's', '2024-11-30 05:57:40', 8, 'Sad', ''),
(167, 's', '2024-11-30', NULL, 's', '2024-11-30 05:57:49', 8, 'Sad', ''),
(168, 's', '2024-11-30', NULL, 's', '2024-11-30 05:58:28', 8, 'Sad', ''),
(169, 's', '2024-11-30', NULL, 's', '2024-11-30 05:58:47', 8, 'Sad', ''),
(170, 's', '2024-11-30', NULL, 's', '2024-11-30 06:05:34', 8, 'Happy', ''),
(171, 'asd', '2024-11-30', NULL, 'dsa', '2024-11-30 06:07:03', 8, 'Excited', ''),
(172, 'asd', '2024-11-30', NULL, 'dsa', '2024-11-30 06:07:11', 8, 'Excited', ''),
(173, 's', '2024-11-30', NULL, 'asd', '2024-11-30 06:13:11', 8, 'Focused', 'dsa'),
(174, 'with gratitude', '2024-11-30', NULL, 'Gratitude', '2024-11-30 06:13:41', 8, 'Happy', 'This is Gratitude'),
(175, 's', '2024-11-30', NULL, 'asd', '2024-11-30 06:15:44', 8, 'Focused', 'dsa'),
(176, 'Tsss', '2024-11-30', NULL, 'ss', '2024-11-30 06:17:41', 8, 'Happy', 'Hindi undefined'),
(177, 'with Image', '2024-11-30', NULL, 'gumana gana image!!!', '2024-11-30 06:59:53', 9, 'Happy', 'ty'),
(178, 'with Image', '2024-11-30', NULL, 'gumana gana image!!!', '2024-11-30 07:01:20', 9, 'Happy', 'ty'),
(179, 'gumagana kana!', '2024-11-30', NULL, 'with image', '2024-11-30 07:04:41', 9, 'Calm', 'herllpp!'),
(180, 'with img', '2024-11-30', 'uploads/1732950482_HBD.png', 'img ', '2024-11-30 07:08:02', 8, 'Relaxed', 'thankful ako kasi grateful ako'),
(181, 'PWEDE NA MAGUPLOAD NG IMAGE!!!', '2024-11-30', 'uploads/1732950830_462574220_1072833557855386_4485544773077299776_n.jpg', 'HWEUAAAHHHHHHH', '2024-11-30 07:13:50', 8, 'Calm', 'I think uno???'),
(182, 'Salta', '2024-11-30', 'uploads/1732951050_462574220_1072833557855386_4485544773077299776_n.jpg', 'Ingat ka palagi ', '2024-11-30 07:17:30', 8, 'Happy', 'namo'),
(183, 'picture', '2024-11-30', 'uploads/1732978542_Screenshot 2024-11-30 225510.png', 'ni salta', '2024-11-30 14:55:42', 8, 'Happy', 'thankfuul daw si shiro'),
(184, 'Kulot', '2024-11-30', 'uploads/1732978835_Screenshot 2024-11-30 230008.png', 'kulot ', '2024-11-30 15:00:35', 8, 'Relaxed', 'kulot'),
(185, 'Dear Shiro', '2024-12-01', 'uploads/1733030351_Screenshot 2024-11-30 230008.png', 'Shiro Salta pls, ikaw na bahala sa lunch ng mga panels ', '2024-12-01 05:19:11', 17, 'Happy', 'thankful kami sayo'),
(186, 'LOREM+', '2024-12-01', 'uploads/1733030607_pp.jpg', '<p>Lorem ipsum dolor sit amet. In neque excepturi ut natus rerum cum galisum pariatur in dolor ratione eos nisi cumque. Cum perferendis expedita non nesciunt tempora vel corporis facere ut eaque doloribus qui soluta ipsum! Sit cumque excepturi in voluptatum pariatur rem suscipit blanditiis eos doloribus aliquam qui pariatur quod. In facilis consequatur et aperiam voluptatum in laborum nemo. </p><p>Ut perspiciatis omnis qui quasi obcaecati ex galisum odit. Qui saepe aperiam aut aperiam corporis ut temporibus enim. </p><p>Id aspernatur fugiat eos internos incidunt non laborum tempore ut recusandae dolores. Eum minus omnis qui maiores voluptatem aut Quis modi et voluptas necessitatibus in ipsam officia vel velit provident! Ut incidunt architecto et voluptates accusantium rem eaque voluptatem sed omnis nesciunt aut eveniet adipisci. </p>\\r\\n', '2024-12-01 05:23:27', 17, 'Energetic', 'LOREM'),
(187, 'LOREM', '2024-12-01', 'uploads/1733030636_462574220_1072833557855386_4485544773077299776_n.jpg', '<p>Lorem ipsum dolor sit amet. In neque excepturi ut natus rerum cum galisum pariatur in dolor ratione eos nisi cumque. Cum perferendis expedita non nesciunt tempora vel corporis facere ut eaque doloribus qui soluta ipsum! Sit cumque excepturi in voluptatum pariatur rem suscipit blanditiis eos doloribus aliquam qui pariatur quod. In facilis consequatur et aperiam voluptatum in laborum nemo. </p><p>Ut perspiciatis omnis qui quasi obcaecati ex galisum odit. Qui saepe aperiam aut aperiam corporis ut temporibus enim. </p><p>Id aspernatur fugiat eos internos incidunt non laborum tempore ut recusandae dolores. Eum minus omnis qui maiores voluptatem aut Quis modi et voluptas necessitatibus in ipsam officia vel velit provident! Ut incidunt architecto et voluptates accusantium rem eaque voluptatem sed omnis nesciunt aut eveniet adipisci. </p>\\r\\n', '2024-12-01 05:23:56', 17, 'Relaxed', 'LOREMMMM'),
(188, 'LOREM', '2024-12-01', 'uploads/1733030650_HBD.png', '<p>Lorem ipsum dolor sit amet. In neque excepturi ut natus rerum cum galisum pariatur in dolor ratione eos nisi cumque. Cum perferendis expedita non nesciunt tempora vel corporis facere ut eaque doloribus qui soluta ipsum! Sit cumque excepturi in voluptatum pariatur rem suscipit blanditiis eos doloribus aliquam qui pariatur quod. In facilis consequatur et aperiam voluptatum in laborum nemo. </p><p>Ut perspiciatis omnis qui quasi obcaecati ex galisum odit. Qui saepe aperiam aut aperiam corporis ut temporibus enim. </p><p>Id aspernatur fugiat eos internos incidunt non laborum tempore ut recusandae dolores. Eum minus omnis qui maiores voluptatem aut Quis modi et voluptas necessitatibus in ipsam officia vel velit provident! Ut incidunt architecto et voluptates accusantium rem eaque voluptatem sed omnis nesciunt aut eveniet adipisci. </p>\\r\\n', '2024-12-01 05:24:10', 17, 'Excited', 'LOREM'),
(189, 'LOREM', '2024-12-01', 'uploads/1733030750_HBD.png', '<p>Lorem ipsum dolor sit amet. In neque excepturi ut natus rerum cum galisum pariatur in dolor ratione eos nisi cumque. Cum perferendis expedita non nesciunt tempora vel corporis facere ut eaque doloribus qui soluta ipsum! Sit cumque excepturi in voluptatum pariatur rem suscipit blanditiis eos doloribus aliquam qui pariatur quod. In facilis consequatur et aperiam voluptatum in laborum nemo. </p><p>Ut perspiciatis omnis qui quasi obcaecati ex galisum odit. Qui saepe aperiam aut aperiam corporis ut temporibus enim. </p><p>Id aspernatur fugiat eos internos incidunt non laborum tempore ut recusandae dolores. Eum minus omnis qui maiores voluptatem aut Quis modi et voluptas necessitatibus in ipsam officia vel velit provident! Ut incidunt architecto et voluptates accusantium rem eaque voluptatem sed omnis nesciunt aut eveniet adipisci. </p>\\r\\n', '2024-12-01 05:25:50', 17, 'Excited', 'LOREM'),
(190, 'LOREM', '2024-12-01', 'uploads/1733030781_HBD.png', '<p>Lorem ipsum dolor sit amet. In neque excepturi ut natus rerum cum galisum pariatur in dolor ratione eos nisi cumque. Cum perferendis expedita non nesciunt tempora vel corporis facere ut eaque doloribus qui soluta ipsum! Sit cumque excepturi in voluptatum pariatur rem suscipit blanditiis eos doloribus aliquam qui pariatur quod. In facilis consequatur et aperiam voluptatum in laborum nemo. </p><p>Ut perspiciatis omnis qui quasi obcaecati ex galisum odit. Qui saepe aperiam aut aperiam corporis ut temporibus enim. </p><p>Id aspernatur fugiat eos internos incidunt non laborum tempore ut recusandae dolores. Eum minus omnis qui maiores voluptatem aut Quis modi et voluptas necessitatibus in ipsam officia vel velit provident! Ut incidunt architecto et voluptates accusantium rem eaque voluptatem sed omnis nesciunt aut eveniet adipisci. </p>\\r\\n', '2024-12-01 05:26:21', 17, 'Excited', 'LOREM'),
(191, 'LOREM', '2024-12-01', 'uploads/1733030865_HBD.png', '<p>Lorem ipsum dolor sit amet. In neque excepturi ut natus rerum cum galisum pariatur in dolor ratione eos nisi cumque. Cum perferendis expedita non nesciunt tempora vel corporis facere ut eaque doloribus qui soluta ipsum! Sit cumque excepturi in voluptatum pariatur rem suscipit blanditiis eos doloribus aliquam qui pariatur quod. In facilis consequatur et aperiam voluptatum in laborum nemo. </p><p>Ut perspiciatis omnis qui quasi obcaecati ex galisum odit. Qui saepe aperiam aut aperiam corporis ut temporibus enim. </p><p>Id aspernatur fugiat eos internos incidunt non laborum tempore ut recusandae dolores. Eum minus omnis qui maiores voluptatem aut Quis modi et voluptas necessitatibus in ipsam officia vel velit provident! Ut incidunt architecto et voluptates accusantium rem eaque voluptatem sed omnis nesciunt aut eveniet adipisci. </p>\\r\\n', '2024-12-01 05:27:45', 17, 'Excited', 'LOREM'),
(194, 'lorem', '2024-12-01', 'uploads/1733060274_HBD.png', 'lorem', '2024-12-01 13:37:54', 19, 'Happy', 'lorem'),
(195, 'lorem', '2024-12-01', 'uploads/1733060338_logo.png', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:38:58', 19, 'Relaxed', 'lorem'),
(196, 'lorem', '2024-12-01', 'uploads/1733060354_image.png', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:39:14', 19, 'Energetic', 'loremm'),
(197, 'lorem', '2024-12-01', 'uploads/1733060369_image1.png', 'loremmm', '2024-12-01 13:39:29', 19, 'Relaxed', 'lorermrmmrm'),
(198, 'lorem,emme', '2024-12-01', 'uploads/1733060385_image2.png', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:39:45', 19, 'Angry', 'loremm'),
(199, 'lorem', '2024-12-01', 'uploads/1733060405_logo.png', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:40:05', 19, 'Anxious', 'lore,mmm'),
(200, 'loremrm', '2024-12-01', 'uploads/1733060432_logo.png', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:40:32', 19, 'Relaxed', 're'),
(201, 'lorem', '2024-12-01', 'uploads/1733060449_autumn.png', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:40:49', 19, 'Sad', 'LOREM!'),
(202, 'lorem', '2024-12-01', 'uploads/1733060478_new_bg.png', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:41:18', 19, 'Focused', 'LOREMM'),
(203, 'LOREM', '2024-12-01', 'uploads/1733060496_book_ring.png', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:41:36', 19, 'Calm', 'LOREM'),
(204, 'LoReM', '2024-12-01', 'uploads/1733060551_blob1.svg', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:42:31', 19, 'Energetic', 'LoOReMM'),
(205, 'LLLOOORRREEEMMM', '2024-12-01', 'uploads/1733060587_layer2.svg', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:43:07', 19, 'Content', 'LLLOOORRREEEMMM'),
(206, 'LOREM', '2024-12-01', 'uploads/1733060610_layer1.svg', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2024-12-01 13:43:30', 19, 'Sad', 'LOREM'),
(207, 'LOREMM', '2023-12-01', 'uploads/1733060626_pexels-8moments-1323550 2 (1).jpg', '<p>Lorem ipsum dolor sit amet. Est minus quia ea voluptas corporis sed fugit asperiores ut ducimus provident At veritatis enim ab atque expedita. Ad delectus voluptatibus qui rerum dicta sed placeat pariatur. Et molestias voluptas aut reiciendis iusto et consequatur dicta nam molestias beatae. </p><p>In iure molestiae 33 veritatis optio a reiciendis quos eum dignissimos nulla ut libero provident sit recusandae iure? Aut aspernatur enim id dicta similique 33 sapiente odit? Qui consequuntur voluptas et accusamus architecto quo velit excepturi. </p><p>In deserunt repellat aut quia internos ea quia voluptates et vitae molestiae quo totam Quis rem deleniti enim vel beatae voluptatem. Id mollitia sunt ea dolorem omnis in magni optio ut error voluptatum qui dicta rerum. Et libero laborum eum odio facilis aut sunt atque id sint ipsam ut laborum excepturi qui quidem rerum et minima nulla. </p>\\r\\n', '2023-12-01 13:43:46', 19, 'Focused', 'LOREMM'),
(208, 'LOWREYM', '2023-12-01', 'uploads/1733060661_462574220_1072833557855386_4485544773077299776_n.jpg', '<p>Lorem ipsum dolor sit amet. Sed voluptatem perspiciatis et enim deserunt aut quia saepe. Nam eaque velit rem galisum asperiores non vitae sunt in quos adipisci. 33 quae praesentium ad autem dolores sed nobis illo sit earum fugiat. </p><p>Est nesciunt nesciunt hic inventore voluptatibus aut doloremque nulla hic ipsa explicabo nam laborum sint! Et voluptates quos eos architecto consequatur et nemo ipsa. Non dolores quisquam qui quos deleniti ex sunt rerum in Quis magni. Eum quod dolorum est officia maiores a repudiandae adipisci et distinctio facilis qui fuga sint sed fuga sunt ut molestias perspiciatis. </p><p>Sed iure dolore et voluptas voluptas cum rerum delectus qui culpa natus rem architecto repudiandae! Cum illo beatae et optio dolorem sed praesentium fugit! Et amet natus ea ipsum omnis non ullam voluptas aut modi delectus. </p>\\r\\n', '2023-12-01 13:44:21', 19, 'Excited', 'LOWREYM'),
(210, 'lorem', '2023-12-01', 'uploads/1733061100_Screenshot 2024-08-23 142613.png', 'test@gmail.com<p>Lorem ipsum dolor sit amet. Ea vitae amet rem cupiditate autem quo nulla recusandae. Id sequi deleniti et laudantium repellendus est minus dolor. Est unde provident quo internos doloribus in ipsa veritatis eos quia voluptatem id suscipit quod et voluptatem sequi. Qui reprehenderit dolore ab voluptas distinctio ea enim facilis sed alias officiis rem earum quaerat a voluptate consequuntur et rerum necessitatibus. </p><p>Et internos expedita et enim architecto ea tempore aliquam. Qui illum velit id minima maxime ex itaque ullam id dolor soluta eos eaque internos. </p><p>Ut cupiditate autem aut neque consequatur et quisquam iure 33 corrupti necessitatibus. Aut molestiae accusamus et corporis eaque qui eaque nisi. Qui dolor facilis quo illo consectetur eum repellendus tempore in enim velit non quia aliquam. Vel sequi laboriosam At cumque sapiente est dolores blanditiis ut laborum odio. </p>\\r\\n', '2023-12-01 13:51:40', 19, 'Happy', 'resasd'),
(211, 'asd', '2023-10-01', 'uploads/1733061116_Screenshot 2024-08-23 142608.png', '<p>Lorem ipsum dolor sit amet. Ea vitae amet rem cupiditate autem quo nulla recusandae. Id sequi deleniti et laudantium repellendus est minus dolor. Est unde provident quo internos doloribus in ipsa veritatis eos quia voluptatem id suscipit quod et voluptatem sequi. Qui reprehenderit dolore ab voluptas distinctio ea enim facilis sed alias officiis rem earum quaerat a voluptate consequuntur et rerum necessitatibus. </p><p>Et internos expedita et enim architecto ea tempore aliquam. Qui illum velit id minima maxime ex itaque ullam id dolor soluta eos eaque internos. </p><p>Ut cupiditate autem aut neque consequatur et quisquam iure 33 corrupti necessitatibus. Aut molestiae accusamus et corporis eaque qui eaque nisi. Qui dolor facilis quo illo consectetur eum repellendus tempore in enim velit non quia aliquam. Vel sequi laboriosam At cumque sapiente est dolores blanditiis ut laborum odio. </p>\\r\\n', '2023-10-01 13:53:13', 19, 'Relaxed', 'sad'),
(212, 'asdasd', '2023-10-01', 'uploads/1733061134_Screenshot 2024-08-23 142438.png', '<p>Lorem ipsum dolor sit amet. Ea vitae amet rem cupiditate autem quo nulla recusandae. Id sequi deleniti et laudantium repellendus est minus dolor. Est unde provident quo internos doloribus in ipsa veritatis eos quia voluptatem id suscipit quod et voluptatem sequi. Qui reprehenderit dolore ab voluptas distinctio ea enim facilis sed alias officiis rem earum quaerat a voluptate consequuntur et rerum necessitatibus. </p><p>Et internos expedita et enim architecto ea tempore aliquam. Qui illum velit id minima maxime ex itaque ullam id dolor soluta eos eaque internos. </p><p>Ut cupiditate autem aut neque consequatur et quisquam iure 33 corrupti necessitatibus. Aut molestiae accusamus et corporis eaque qui eaque nisi. Qui dolor facilis quo illo consectetur eum repellendus tempore in enim velit non quia aliquam. Vel sequi laboriosam At cumque sapiente est dolores blanditiis ut laborum odio. </p>\\r\\n', '2023-10-01 13:53:13', 19, 'Focused', ' asdas'),
(213, 'asdasdasd', '2023-10-01', 'uploads/1733061177_Screenshot 2024-11-28 224259.png', '<p>Lorem ipsum dolor sit amet. Ea vitae amet rem cupiditate autem quo nulla recusandae. Id sequi deleniti et laudantium repellendus est minus dolor. Est unde provident quo internos doloribus in ipsa veritatis eos quia voluptatem id suscipit quod et voluptatem sequi. Qui reprehenderit dolore ab voluptas distinctio ea enim facilis sed alias officiis rem earum quaerat a voluptate consequuntur et rerum necessitatibus. </p><p>Et internos expedita et enim architecto ea tempore aliquam. Qui illum velit id minima maxime ex itaque ullam id dolor soluta eos eaque internos. </p><p>Ut cupiditate autem aut neque consequatur et quisquam iure 33 corrupti necessitatibus. Aut molestiae accusamus et corporis eaque qui eaque nisi. Qui dolor facilis quo illo consectetur eum repellendus tempore in enim velit non quia aliquam. Vel sequi laboriosam At cumque sapiente est dolores blanditiis ut laborum odio. </p>\\r\\n', '2023-10-01 13:53:13', 19, 'Sad', 'sad fcxcvxc');
INSERT INTO `diary_entriess` (`id`, `entry_title`, `date_string`, `image_html`, `entry_text`, `created_at`, `user_id`, `mood`, `gratitude`) VALUES
(214, 'this is isisis', '2023-10-01', 'uploads/1733061193_Screenshot 2024-10-13 121817.png', '<p>Lorem ipsum dolor sit amet. Ea vitae amet rem cupiditate autem quo nulla recusandae. Id sequi deleniti et laudantium repellendus est minus dolor. Est unde provident quo internos doloribus in ipsa veritatis eos quia voluptatem id suscipit quod et voluptatem sequi. Qui reprehenderit dolore ab voluptas distinctio ea enim facilis sed alias officiis rem earum quaerat a voluptate consequuntur et rerum necessitatibus. </p><p>Et internos expedita et enim architecto ea tempore aliquam. Qui illum velit id minima maxime ex itaque ullam id dolor soluta eos eaque internos. </p><p>Ut cupiditate autem aut neque consequatur et quisquam iure 33 corrupti necessitatibus. Aut molestiae accusamus et corporis eaque qui eaque nisi. Qui dolor facilis quo illo consectetur eum repellendus tempore in enim velit non quia aliquam. Vel sequi laboriosam At cumque sapiente est dolores blanditiis ut laborum odio. </p>\\r\\n', '2023-10-01 13:53:13', 19, 'Excited', 'sisisiis'),
(215, 'lorem', '2024-12-01', 'uploads/1733061576_Screenshot 2024-10-13 221553.png', '<p>Lorem ipsum dolor sit amet. Qui voluptatem iusto est quae possimus ut omnis ratione et earum accusamus. Aut incidunt distinctio quo perferendis debitis vel magni iusto! Ea earum quasi et neque nihil sit aliquid quia aut vero enim. </p><p>Ut asperiores reiciendis quo corrupti nisi id quia impedit est beatae placeat id veritatis atque et ratione eius a quaerat ipsa. Est sapiente aliquam ea ullam consequatur sit quia iusto id illo laborum At quas repellendus. 33 nulla quae ut voluptas quas sed nostrum possimus. </p><p>Eos fugit laborum eos accusantium amet ut vitae possimus est dolor labore eos ipsam dolores. Eum tenetur excepturi est esse quidem qui modi maiores ut ipsum iste eos earum galisum aut commodi autem. Vel molestiae voluptate aut rerum asperiores hic ipsum quia. </p>\\r\\n', '2024-12-01 13:59:36', 19, 'Angry', 'lorem'),
(216, 'lorem', '2024-12-01', 'uploads/1733061581_Screenshot 2024-10-13 221553.png', '<p>Lorem ipsum dolor sit amet. Qui voluptatem iusto est quae possimus ut omnis ratione et earum accusamus. Aut incidunt distinctio quo perferendis debitis vel magni iusto! Ea earum quasi et neque nihil sit aliquid quia aut vero enim. </p><p>Ut asperiores reiciendis quo corrupti nisi id quia impedit est beatae placeat id veritatis atque et ratione eius a quaerat ipsa. Est sapiente aliquam ea ullam consequatur sit quia iusto id illo laborum At quas repellendus. 33 nulla quae ut voluptas quas sed nostrum possimus. </p><p>Eos fugit laborum eos accusantium amet ut vitae possimus est dolor labore eos ipsam dolores. Eum tenetur excepturi est esse quidem qui modi maiores ut ipsum iste eos earum galisum aut commodi autem. Vel molestiae voluptate aut rerum asperiores hic ipsum quia. </p>\\r\\n', '2024-12-01 13:59:41', 19, 'Angry', 'lorem'),
(217, 'lorem', '2024-12-01', 'uploads/1733061583_Screenshot 2024-10-13 221553.png', '<p>Lorem ipsum dolor sit amet. Qui voluptatem iusto est quae possimus ut omnis ratione et earum accusamus. Aut incidunt distinctio quo perferendis debitis vel magni iusto! Ea earum quasi et neque nihil sit aliquid quia aut vero enim. </p><p>Ut asperiores reiciendis quo corrupti nisi id quia impedit est beatae placeat id veritatis atque et ratione eius a quaerat ipsa. Est sapiente aliquam ea ullam consequatur sit quia iusto id illo laborum At quas repellendus. 33 nulla quae ut voluptas quas sed nostrum possimus. </p><p>Eos fugit laborum eos accusantium amet ut vitae possimus est dolor labore eos ipsam dolores. Eum tenetur excepturi est esse quidem qui modi maiores ut ipsum iste eos earum galisum aut commodi autem. Vel molestiae voluptate aut rerum asperiores hic ipsum quia. </p>\\r\\n', '2024-12-01 13:59:43', 19, 'Angry', 'lorem'),
(218, 'lorem', '2024-12-01', 'uploads/1733061586_Screenshot 2024-10-13 221553.png', '<p>Lorem ipsum dolor sit amet. Qui voluptatem iusto est quae possimus ut omnis ratione et earum accusamus. Aut incidunt distinctio quo perferendis debitis vel magni iusto! Ea earum quasi et neque nihil sit aliquid quia aut vero enim. </p><p>Ut asperiores reiciendis quo corrupti nisi id quia impedit est beatae placeat id veritatis atque et ratione eius a quaerat ipsa. Est sapiente aliquam ea ullam consequatur sit quia iusto id illo laborum At quas repellendus. 33 nulla quae ut voluptas quas sed nostrum possimus. </p><p>Eos fugit laborum eos accusantium amet ut vitae possimus est dolor labore eos ipsam dolores. Eum tenetur excepturi est esse quidem qui modi maiores ut ipsum iste eos earum galisum aut commodi autem. Vel molestiae voluptate aut rerum asperiores hic ipsum quia. </p>\\r\\n', '2024-12-01 13:59:46', 19, 'Angry', 'lorem'),
(219, 'lorem', '2024-12-01', 'uploads/1733061588_Screenshot 2024-10-13 221553.png', '<p>Lorem ipsum dolor sit amet. Qui voluptatem iusto est quae possimus ut omnis ratione et earum accusamus. Aut incidunt distinctio quo perferendis debitis vel magni iusto! Ea earum quasi et neque nihil sit aliquid quia aut vero enim. </p><p>Ut asperiores reiciendis quo corrupti nisi id quia impedit est beatae placeat id veritatis atque et ratione eius a quaerat ipsa. Est sapiente aliquam ea ullam consequatur sit quia iusto id illo laborum At quas repellendus. 33 nulla quae ut voluptas quas sed nostrum possimus. </p><p>Eos fugit laborum eos accusantium amet ut vitae possimus est dolor labore eos ipsam dolores. Eum tenetur excepturi est esse quidem qui modi maiores ut ipsum iste eos earum galisum aut commodi autem. Vel molestiae voluptate aut rerum asperiores hic ipsum quia. </p>\\r\\n', '2024-12-01 13:59:48', 19, 'Angry', 'lorem'),
(220, 'lorem', '2024-12-01', 'uploads/1733061590_Screenshot 2024-10-13 221553.png', '<p>Lorem ipsum dolor sit amet. Qui voluptatem iusto est quae possimus ut omnis ratione et earum accusamus. Aut incidunt distinctio quo perferendis debitis vel magni iusto! Ea earum quasi et neque nihil sit aliquid quia aut vero enim. </p><p>Ut asperiores reiciendis quo corrupti nisi id quia impedit est beatae placeat id veritatis atque et ratione eius a quaerat ipsa. Est sapiente aliquam ea ullam consequatur sit quia iusto id illo laborum At quas repellendus. 33 nulla quae ut voluptas quas sed nostrum possimus. </p><p>Eos fugit laborum eos accusantium amet ut vitae possimus est dolor labore eos ipsam dolores. Eum tenetur excepturi est esse quidem qui modi maiores ut ipsum iste eos earum galisum aut commodi autem. Vel molestiae voluptate aut rerum asperiores hic ipsum quia. </p>\\r\\n', '2024-12-01 13:59:50', 19, 'Angry', 'lorem'),
(221, 'lorem', '2024-12-01', 'uploads/1733061593_Screenshot 2024-10-13 221553.png', '<p>Lorem ipsum dolor sit amet. Qui voluptatem iusto est quae possimus ut omnis ratione et earum accusamus. Aut incidunt distinctio quo perferendis debitis vel magni iusto! Ea earum quasi et neque nihil sit aliquid quia aut vero enim. </p><p>Ut asperiores reiciendis quo corrupti nisi id quia impedit est beatae placeat id veritatis atque et ratione eius a quaerat ipsa. Est sapiente aliquam ea ullam consequatur sit quia iusto id illo laborum At quas repellendus. 33 nulla quae ut voluptas quas sed nostrum possimus. </p><p>Eos fugit laborum eos accusantium amet ut vitae possimus est dolor labore eos ipsam dolores. Eum tenetur excepturi est esse quidem qui modi maiores ut ipsum iste eos earum galisum aut commodi autem. Vel molestiae voluptate aut rerum asperiores hic ipsum quia. </p>\\r\\n', '2024-12-01 13:59:53', 19, 'Angry', 'lorem'),
(222, 'lorem', '2024-12-01', 'uploads/1733061755_Screenshot 2024-10-13 221553.png', '<p>Lorem ipsum dolor sit amet. Qui voluptatem iusto est quae possimus ut omnis ratione et earum accusamus. Aut incidunt distinctio quo perferendis debitis vel magni iusto! Ea earum quasi et neque nihil sit aliquid quia aut vero enim. </p><p>Ut asperiores reiciendis quo corrupti nisi id quia impedit est beatae placeat id veritatis atque et ratione eius a quaerat ipsa. Est sapiente aliquam ea ullam consequatur sit quia iusto id illo laborum At quas repellendus. 33 nulla quae ut voluptas quas sed nostrum possimus. </p><p>Eos fugit laborum eos accusantium amet ut vitae possimus est dolor labore eos ipsam dolores. Eum tenetur excepturi est esse quidem qui modi maiores ut ipsum iste eos earum galisum aut commodi autem. Vel molestiae voluptate aut rerum asperiores hic ipsum quia. </p>\\r\\n', '2024-12-01 14:02:35', 19, 'Angry', 'lorem');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_table`
--
ALTER TABLE `account_table`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `diary_entriess`
--
ALTER TABLE `diary_entriess`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_table`
--
ALTER TABLE `account_table`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `diary_entriess`
--
ALTER TABLE `diary_entriess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
