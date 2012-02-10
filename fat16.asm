;*****************************************************************************
;; Derived partition constants
;*****************************************************************************
MBR_BLOCK_LBA_UW			equ     0x0000
MBR_BLOCK_LBA_LW			equ     0x0000
FAT16_BOOT_BLOCK_LBA_UW			equ	PART0_START_LBA_UW
FAT16_BOOT_BLOCK_LBA_LW			equ	PART0_START_LBA_LW
FAT16_FAT_TABLES_BLOCK_LBA_UW		equ	0x0000 ; Forget about upper word... Because QTASM is retarded.
FAT16_FAT_TABLES_BLOCK_LBA_LW		equ	((FAT16_BOOT_BLOCK_LBA_LW) + 1)
FAT16_FAT_TABLES_COPY_BLOCK_LBA_UW	equ     0x0000
FAT16_FAT_TABLES_COPY_BLOCK_LBA_LW	equ     (FAT16_FAT_TABLES_BLOCK_LBA_LW + FAT16_PART0_SECTORS_PER_FAT)
FAT16_ROOT_DIRECTORY_ENTRY_LBA_UW	equ     0x0000
FAT16_ROOT_DIRECTORY_ENTRY_LBA_LW	equ     (FAT16_FAT_TABLES_BLOCK_LBA_LW + ((FAT16_PART0_SECTORS_PER_FAT) * 2))

FAT16_DATA_AREA_LBA_UW			equ	0x0000
FAT16_DATA_AREA_LBA_LW			equ	(FAT16_ROOT_DIRECTORY_ENTRY_LBA_LW + ((FAT16_PART0_MAX_ROOT_DIR_ENTRIES * 32) / BLOCKSIZE))

;*****************************************************************************


;*****************************************************************************
;; Partition Format
;*****************************************************************************
BOOT_SIGNATURE				equ	0xaa55

;; Partition Record in MBR
PART0_RECORD_OFFSET			equ     (send_buffer + 0x01BE)
PART0_STATUS_OFFSET			equ	(PART0_RECORD_OFFSET)
PART0_START_HEAD_OFFSET			equ     (PART0_RECORD_OFFSET + 1)
PART0_START_SECT_76CYLHIGH_OFFSET	equ	(PART0_RECORD_OFFSET + 2)
PART0_START_CYL_OFFSET			equ	(PART0_RECORD_OFFSET + 3)
PART0_PARTITION_TYPE_OFFSET		equ	(PART0_RECORD_OFFSET + 4)
PART0_END_HEAD_OFFSET			equ	(PART0_RECORD_OFFSET + 5)
PART0_END_SECT_76CYLHIGH_OFFSET		equ	(PART0_RECORD_OFFSET + 6)
PART0_END_CYL_OFFSET			equ	(PART0_RECORD_OFFSET + 7)
PART0_START_LBA_UW_OFFSET		equ	(PART0_RECORD_OFFSET + 11)
PART0_START_LBA_LW_OFFSET		equ	(PART0_RECORD_OFFSET + 8)
PART0_SECTORS_UW_OFFSET			equ	(PART0_RECORD_OFFSET + 14)
PART0_SECTORS_LW_OFFSET			equ	(PART0_RECORD_OFFSET + 12)
BOOT_SIGNATURE_OFFSET			equ	(send_buffer + 0x01fe)
;*****************************************************************************

;*****************************************************************************
;; Partition Data
;*****************************************************************************
;; Fields:
PART0_STATUS				equ	  0x00 ;  0:  P0 status (0x00 = non-bootable, 0x80 = bootable)
PART0_START_HEAD			equ	  0x01 ;  1: Start CHS: Head
PART0_START_SECT_76CYLHIGH		equ	  0x01 ;  2: Start CHS: Sector in bits 5..0; bits 7..6 are high bits of Cylinder
PART0_START_CYL				equ	  0x00 ;  3: Start CHS: Bits 7..0 of Cylinder
PART0_PARTITION_TYPE			equ	  0x0e ;  4: Partition Type
PART0_END_HEAD				equ	  0x1f ;  5: Ending CHS: Head
PART0_END_SECT_76CYLHIGH		equ	  0xff ;  6: Ending CHS: Sector in bits 5..0; bits 7..6 are high bits of Cylinder
PART0_END_CYL				equ	  0xff ;  7: Ending CHS: Bits 7..0 of Cylinder
PART0_START_LBA_UW			equ	0x0000 ; 11: Starting LBA: Upper Word
PART0_START_LBA_LW			equ	0x003f ;  8: Starting LBA: Lower Word
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
	db	'STIERLITZ  ' ; Volume name of partition (11 chars)
	db      'FAT16   ' ; FAT Name (must equal "FAT16   ")
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
	db	0xf6
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
