;*****************************************************************************
;; Partition Data
;*****************************************************************************
BOOT_SIGNATURE				equ	0xaa55

;; Partition Record in MBR
PART0_RECORD_OFFSET			equ     0x01BE
;; Fields:
PART0_STATUS				equ	  0x00 ;  0:  P0 status (0x00 = non-bootable, 0x80 = bootable)
PART0_START_HEAD			equ	  0x01 ;  1: Start CHS: Head
PART0_START_SECT_76CYLHIGH		equ	  0x01 ;  2: Start CHS: Sector in bits 5..0; bits 7..6 are high bits of Cylinder
PART0_START_CYL				equ	  0x00 ;  3: Start CHS: Bits 7..0 of Cylinder
PART0_PARTITION_TYPE			equ	  0x0e ;  4: Partition Type
PART0_END_HEAD				equ	  0x1f ;  5: Ending CHS: Head
PART0_END_SECT_76CYLHIGH		equ	  0xff ;  6: Ending CHS: Sector in bits 5..0; bits 7..6 are high bits of Cylinder
PART0_END_CYL				equ	  0xff ;  7: Ending CHS: Bits 7..0 of Cylinder
PART0_START_LBA_UW			equ	0x0000 ; 11: Starting LBA: Byte 3
PART0_START_LBA_LW			equ	0x003f ;  8: Starting LBA: Byte 0
PART0_SECTORS_UW			equ	0x001f ; 14: Size in sectors
PART0_SECTORS_LW			equ	0xfdc1 ; 12: Size in sectors

;; Our partition parameters
FAT16_PART0_BYTES_PER_SECTOR		equ	0x0200 ; Bytes per sector
FAT16_PART0_SECTORS_PER_CLUSTER		equ	  0x40 ; Sectors per cluster
FAT16_PART0_RESERVED_SECTORS		equ	0x0001 ; Reserved sectors
FAT16_PART0_COPIES_OF_FAT		equ	  0x02 ; # of copies of FAT
FAT16_PART0_MAX_ROOT_DIR_ENTRIES	equ	0x0200 ; Max root dir entries
FAT16_PART0_MAX_SECTS_IF_UNDR_32M	equ	0x0000 ; # of sectors in part < 32MB
FAT16_PART0_MEDIA_DESCRIPTOR		equ	  0xf8 ; media descriptor
FAT16_PART0_SECTORS_PER_FAT		equ	0x0080 ; sectors per FAT
FAT16_PART0_SECTORS_PER_TRACK		equ	0x003f ; sectors per track
FAT16_PART0_HEADS			equ	0x0020 ; # of heads
FAT16_PART0_LOGICAL_DRIVE_NUMBER	equ	0x0080 ; Logical drive number of partition
FAT16_PART0_EXTENDED_SIGNATURE		equ	  0x29 ; Extended signature - must equal 0x29
FAT16_PART0_PARTITION_SERIAL_NUM_UW	equ	0x4f30 ; Serial number of partition (B1)
FAT16_PART0_PARTITION_SERIAL_NUM_LW	equ	0x5f7b ; Serial number of partition (B0)
;*****************************************************************************


;*****************************************************************************
;; Block no. 0: superblock
;*****************************************************************************
mbr_block:
	db	0xfa
	db	0x33
	db	0xc0
	db	0x8e
	db	0xd0
	db	0xbc
	db	0x00
	db	0x7c
	db	0x8b
	db	0xf4
	db	0x50
	db	0x07
	db	0x50
	db	0x1f
	db	0xfb
	db	0xfc
	db	0xbf
	db	0x00
	db	0x06
	db	0xb9
	db	0x00
	db	0x01
	db	0xf2
	db	0xa5
	db	0xea
	db	0x1d
	db	0x06
	db	0x00
	db	0x00
	db	0xbe
	db	0xbe
	db	0x07
	db	0xb3
	db	0x04
	db	0x80
	db	0x3c
	db	0x80
	db	0x74
	db	0x0e
	db	0x80
	db	0x3c
	db	0x00
	db	0x75
	db	0x1c
	db	0x83
	db	0xc6
	db	0x10
	db	0xfe
	db	0xcb
	db	0x75
	db	0xef
	db	0xcd
	db	0x18
	db	0x8b
	db	0x14
	db	0x8b
	db	0x4c
	db	0x02
	db	0x8b
	db	0xee
	db	0x83
	db	0xc6
	db	0x10
	db	0xfe
	db	0xcb
	db	0x74
	db	0x1a
	db	0x80
	db	0x3c
	db	0x00
	db	0x74
	db	0xf4
	db	0xbe
	db	0x8b
	db	0x06
	db	0xac
	db	0x3c
	db	0x00
	db	0x74
	db	0x0b
	db	0x56
	db	0xbb
	db	0x07
	db	0x00
	db	0xb4
	db	0x0e
	db	0xcd
	db	0x10
	db	0x5e
	db	0xeb
	db	0xf0
	db	0xeb
	db	0xfe
	db	0xbf
	db	0x05
	db	0x00
	db	0xbb
	db	0x00
	db	0x7c
	db	0xb8
	db	0x01
	db	0x02
	db	0x57
	db	0xcd
	db	0x13
	db	0x5f
	db	0x73
	db	0x0c
	db	0x33
	db	0xc0
	db	0xcd
	db	0x13
	db	0x4f
	db	0x75
	db	0xed
	db	0xbe
	db	0xa3
	db	0x06
	db	0xeb
	db	0xd3
	db	0xbe
	db	0xc2
	db	0x06
	db	0xbf
	db	0xfe
	db	0x7d
	db	0x81
	db	0x3d
	db	0x55
	db	0xaa
	db	0x75
	db	0xc7
	db	0x8b
	db	0xf5
	db	0xea
	db	0x00
	db	0x7c
	db	0x00
	db	0x00
	db	0x49
	db	0x6e
	db	0x76
	db	0x61
	db	0x6c
	db	0x69
	db	0x64
	db	0x20
	db	0x70
	db	0x61
	db	0x72
	db	0x74
	db	0x69
	db	0x74
	db	0x69
	db	0x6f
	db	0x6e
	db	0x20
	db	0x74
	db	0x61
	db	0x62
	db	0x6c
	db	0x65
	db	0x00
	db	0x45
	db	0x72
	db	0x72
	db	0x6f
	db	0x72
	db	0x20
	db	0x6c
	db	0x6f
	db	0x61
	db	0x64
	db	0x69
	db	0x6e
	db	0x67
	db	0x20
	db	0x6f
	db	0x70
	db	0x65
	db	0x72
	db	0x61
	db	0x74
	db	0x69
	db	0x6e
	db	0x67
	db	0x20
	db	0x73
	db	0x79
	db	0x73
	db	0x74
	db	0x65
	db	0x6d
	db	0x00
	db	0x4d
	db	0x69
	db	0x73
	db	0x73
	db	0x69
	db	0x6e
	db	0x67
	db	0x20
	db	0x6f
	db	0x70
	db	0x65
	db	0x72
	db	0x61
	db	0x74
	db	0x69
	db	0x6e
	db	0x67
	db	0x20
	db	0x73
	db	0x79
	db	0x73
	db	0x74
	db	0x65
	db	0x6d
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	PART0_STATUS
	db	PART0_START_HEAD
	db	PART0_START_SECT_76CYLHIGH
	db	PART0_START_CYL
	db	PART0_PARTITION_TYPE
	db	PART0_END_HEAD
	db	PART0_END_SECT_76CYLHIGH
	db	PART0_END_CYL
	dw	PART0_START_LBA_LW
	dw	PART0_START_LBA_UW
	dw	PART0_SECTORS_LW
	dw	PART0_SECTORS_UW
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	dw	BOOT_SIGNATURE
;*****************************************************************************



;; Block no. 10
block_10:
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x28
	db	0x96
	db	0xc4
	db	0x17
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
;; Block no. 192
block_192:
	db	0xf8
	db	0xff
	db	0xff
	db	0xff
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
;; Block no. 320
block_320:
	db	0x55
	db	0x53
	db	0x42
	db	0x20
	db	0x20
	db	0x20
	db	0x20
	db	0x20
	db	0x20
	db	0x20
	db	0x20
	db	0x08
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x27
	db	0xba
	db	0x46
	db	0x40
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00

;*****************************************************************************
boot_block:
	db	0xeb ; jmp
	db	0x3c ; jmp
	db	0x90 ; nop
	db      'MSWIN4.0' ; OEM name (8 chars)
	dw      FAT16_PART0_BYTES_PER_SECTOR
	db      FAT16_PART0_SECTORS_PER_CLUSTER
	dw      FAT16_PART0_RESERVED_SECTORS
	db      FAT16_PART0_COPIES_OF_FAT
	dw      FAT16_PART0_MAX_ROOT_DIR_ENTRIES
	dw      FAT16_PART0_MAX_SECTS_IF_UNDR_32M
	db      FAT16_PART0_MEDIA_DESCRIPTOR
	dw      FAT16_PART0_SECTORS_PER_FAT
	dw      FAT16_PART0_SECTORS_PER_TRACK
	dw      FAT16_PART0_HEADS
	dw      PART0_START_LBA_LW ; # of hidden sectors (LW) from MBR
	dw      PART0_START_LBA_UW ; # of hidden sectors (UW) from MBR
	dw      PART0_SECTORS_LW ; # of sectors (LW) from MBR
	dw      PART0_SECTORS_UW ; # of sectors (UW) from MBR
	dw      FAT16_PART0_LOGICAL_DRIVE_NUMBER
	db      FAT16_PART0_EXTENDED_SIGNATURE
	dw      FAT16_PART0_PARTITION_SERIAL_NUM_LW
	dw      FAT16_PART0_PARTITION_SERIAL_NUM_UW
	db	'USB        '	; Volume name of partition (11 chars)
	db      'FAT16   '	; FAT Name (must equal "FAT16   ")
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	dw	BOOT_SIGNATURE
;*****************************************************************************

	

;; Block no. 64
block_64:
	db	0xf8
	db	0xff
	db	0xff
	db	0xff
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
	db	0x00
