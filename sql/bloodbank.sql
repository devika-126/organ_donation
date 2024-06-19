SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Table structure for table `blooddinfo`
--  donations made by recievers

CREATE TABLE `blooddinfo` (
  `bdid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `bg` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blooddinfo`
--

INSERT INTO `blooddinfo` (`bdid`, `rid`, `bg`) VALUES
(10, 1, 'Kidney'),
(11, 1, 'Heart'),
(12, 4, 'Lungs'),
(13, 4, 'Pancreas'),
(14, 5, 'Lungs'),
(15, 5, 'Heart'),
(16, 5, 'Pancreas'),
(17, 6, 'Lungs'),
(18, 6, 'Hands'),
(19, 6, 'Liver'),
(20, 7, 'Face'),
(21, 7, 'Liver'),
(22, 7, 'Intestines'),
(23, 1, 'Liver');

-- --------------------------------------------------------

--
-- Table structure for table `blooddonate`
-- Info about blood donations

CREATE TABLE `blooddonate` (
  `donoid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `bg` varchar(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bloodinfo`
-- Info about available blood in hospital

CREATE TABLE `bloodinfo` (
  `bid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `bg` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloodinfo`
--

INSERT INTO `bloodinfo` (`bid`, `hid`, `bg`) VALUES
(7, 1, 'Liver'),
(8, 1, 'Pancreas'),
(12, 4, 'Liver'),
(13, 4, 'Kidney'),
(14, 4, 'Lungs'),
(16, 5, 'Kidney'),
(17, 5, 'Heart'),
(18, 5, 'Intestines'),
(20, 5, 'Lungs'),
(21, 6, 'Pancreas'),
(22, 6, 'Liver'),
(23, 6, 'Intestines'),
(24, 7, 'Liver'),
(25, 7, 'Kidney'),
(26, 7, 'Heart'),
(27, 7, 'Lungs'),
(31, 1, 'Heart');

-- --------------------------------------------------------

--
-- Table structure for table `bloodrequest`
-- When requests are made by hospital

CREATE TABLE `bloodrequest` (
  `reqid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `bg` varchar(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL,
  `hname` varchar(100) NOT NULL,
  `hemail` varchar(100) NOT NULL,
  `hpassword` varchar(100) NOT NULL,
  `hphone` varchar(100) NOT NULL,
  `hcity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `hname`, `hemail`, `hpassword`, `hphone`, `hcity`) VALUES
(1, 'Gandhi hospital', 'gandhi@gmail.com', 'gandhi', '7865376358', 'Delhi'),
(4, 'Arunodhaya', 'arunodhaya@gmail.com', 'arunodhaya', '9898988909', 'Ballari'),
(5, 'Columbia Asia', 'columbia@gmail.com', 'asia47', '080616156262', 'Bengaluru'),
(6, 'Apollo Hospital', 'apollo@gmail.com', 'apollo247', '04428293333', 'Chennai'),
(7, 'Sree Amaravathi Multispeciality Hospital', 'sreeamaravathihospitals@gmail.com', 'amaravathi', '09441432567', 'Amaravathi');

-- --------------------------------------------------------

--
-- Table structure for table `receivers`
--

CREATE TABLE `receivers` (
  `id` int(11) NOT NULL,
  `rname` varchar(100) NOT NULL,
  `remail` varchar(100) NOT NULL,
  `rpassword` varchar(100) NOT NULL,
  `rphone` varchar(100) NOT NULL,
  `rbg` varchar(10) NOT NULL,
  `rcity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receivers`
--

INSERT INTO `receivers` (`id`, `rname`, `remail`, `rpassword`, `rphone`, `rbg`, `rcity`) VALUES
(1, 'test', 'test@gmail.com', 'test', '8875643456', 'A+', 'lucknow'),
(4, 'Anoushka', 'xyz@gmail.com', 'anoushka', '9902477355', 'B+', 'Ballari'),
(5, 'Sakshi', 'abcd@gmail.com', 'sakshi', '9380073433', 'B+', 'Tirupathi'),
(6, 'Devika', 'klmn@gmail.com', 'devika', '8106298053', 'B+', 'Hyderabad'),
(7, 'Sayali', 'sayali@gmail.com', 'sayali', '9849492206', 'AB-', 'Bengaluru');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blooddinfo`
--
ALTER TABLE `blooddinfo`
  ADD PRIMARY KEY (`bdid`),
  ADD KEY `blooddinfo_ibfk_2` (`rid`);

--
-- Indexes for table `blooddonate`
--
ALTER TABLE `blooddonate`
  ADD PRIMARY KEY (`donoid`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `bloodinfo`
--
ALTER TABLE `bloodinfo`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `hid` (`hid`);

--
-- Indexes for table `bloodrequest`
--
ALTER TABLE `bloodrequest`
  ADD PRIMARY KEY (`reqid`),
  ADD KEY `hid` (`hid`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receivers`
--
ALTER TABLE `receivers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blooddinfo`
--
ALTER TABLE `blooddinfo`
  MODIFY `bdid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `blooddonate`
--
ALTER TABLE `blooddonate`
  MODIFY `donoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bloodinfo`
--
ALTER TABLE `bloodinfo`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `bloodrequest`
--
ALTER TABLE `bloodrequest`
  MODIFY `reqid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `receivers`
--
ALTER TABLE `receivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blooddinfo`
--
ALTER TABLE `blooddinfo`
  ADD CONSTRAINT `blooddinfo_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `receivers` (`id`);

--
-- Constraints for table `bloodinfo`
--
ALTER TABLE `bloodinfo`
  ADD CONSTRAINT `bloodinfo_ibfk_1` FOREIGN KEY (`hid`) REFERENCES `hospitals` (`id`);
COMMIT;


