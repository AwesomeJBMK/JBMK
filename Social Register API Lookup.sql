--Social Register API Lookup data
INSERT INTO AccountSourceTypes SELECT 1, 'Facebook', 'Social register from Facebook', GETDATE()
INSERT INTO AccountSourceTypes SELECT 2, 'Twitter', 'Social register from Twitter', GETDATE()
INSERT INTO AccountSourceTypes SELECT 3, 'Wechat', 'Social register from Wechat', GETDATE()
INSERT INTO AccountSourceTypes SELECT 4, 'Weibo', 'Social register from Weibo', GETDATE()
GO
INSERT INTO ScoreTypes SELECT 1, 'FEMT', 'Friend Enrollment', GETDATE()
INSERT INTO ScoreTypes SELECT 2, 'FFLM', 'Friend first load money', GETDATE()
INSERT INTO ScoreTypes SELECT 3, 'FFTM', 'Friend first transfer money', GETDATE()
INSERT INTO ScoreTypes SELECT 4, 'FSFD', 'Friend''s friend', GETDATE()
GO