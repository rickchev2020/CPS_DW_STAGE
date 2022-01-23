CREATE TABLE [dbo].[Tax1095bExport]
(
[MemberNumber] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Void CB] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Corrected CB] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R-TIN] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[R-DOB] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R-Last Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R-First Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R-Name Line 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R- Addr Line 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R-Addr Line 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R-City] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R-State] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R-Zip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R-Country] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Policy Origin] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reserved] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[P-Name 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[P-Name 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[P-Addr Line 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[P-Addr Line 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[P-City] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[P-State] [char] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[P-Zip] [char] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[P-Country] [char] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[P-TIN] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I-Name 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I-Name 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I-TIN] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I-Phone] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I-Addr Line 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I-Addr Line 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I-City] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I-State] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I-Zip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[I-Country] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Name 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 7] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 7] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 8] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 8] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 9] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 9] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 10] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 10] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 11] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 11] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 12] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 13] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 13] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 14] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 14] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 15] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 15] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 16] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 16] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 17] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 17] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Name 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-TIN 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-DOB 18] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-All12 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[C-Jan 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Feb 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Mar 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Apr 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-May 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jun 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Jul 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Aug 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Sep 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Oct 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Nov 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C-Dec 18] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TrackingID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tax1095bExport] ADD CONSTRAINT [PK__Tax1095b__643A529B30B1FAD0] PRIMARY KEY CLUSTERED ([R-TIN]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
