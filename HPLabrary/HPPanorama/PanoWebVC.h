

@interface PanoWebVC : UIView
@property(nonatomic,retain)NSString* filePath;
+(PanoWebVC*)createWithFilePath:(NSString*)aFilePath;
-(id)initWithFilePath:(NSString*)aFilePath;
-(void)updateWithFilePath:(NSString*)aFilePath;
@end
