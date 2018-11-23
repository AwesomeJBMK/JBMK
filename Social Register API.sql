--Social Register API Tables Design
CREATE TABLE AccountSourceTypes (
	AccountSourceTypeKey tinyint,
	AccountSourceTypeName nvarchar(50),
	AccountSourceTypeDescription nvarchar(200),
	CreateDate datetime,
	CONSTRAINT [PK_AccountSourceTypeKey] PRIMARY KEY CLUSTERED 
(
	[AccountSourceTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY])
GO 

CREATE TABLE ScoreTypes (
	ScoreTypeKey tinyint,
	ScoreTypeName nvarchar(50),
	ScoreTypeDescription nvarchar(200),
	CreateDate datetime,
	CONSTRAINT [PK_ScoreTypeKey] PRIMARY KEY CLUSTERED 
(
	[ScoreTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY])
GO

CREATE TABLE Accounts (
	AccountKey bigint IDENTITY(1, 10),
	LastName nvarchar(50),
	FirstName nvarchar(50),
	InvitedByAccountKey bigint,
	AccountSourceTypeKey tinyint,
	ValidScore int,
	SocialUserKey int,
	CreateDate datetime,
	ChangeDate datetime,
	CONSTRAINT [PK_AccountKey] PRIMARY KEY CLUSTERED 
(
	[AccountKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY])
GO

CREATE TABLE AccountScoreHistorys (
	AccountScoreHistoryKey bigint IDENTITY(1, 10),
	AccountKey bigint,
	ScoreTypeKey tinyint,
	Score int,
	IsRewarded bit,
	CreateDate datetime,
	CONSTRAINT [PK_AccountScoreHistoryKey] PRIMARY KEY CLUSTERED 
(
	[AccountScoreHistoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY])
GO

CREATE TABLE SocialUsers (
	SocialUserKey int IDENTITY(1, 10),
	SocialLoginUserName nvarchar(50),
	LastName nvarchar(50),
	FirstName nvarchar(50),
	SocialLoginPassword nvarchar(50))
GO