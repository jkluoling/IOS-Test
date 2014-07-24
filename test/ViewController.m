//
//  ViewController.m
//  test
//
//  Created by akatsuki on 7/21/14.
//  Copyright (c) 2014 tj. All rights reserved.
//

#import "ViewController.h"
static NSString * const kUUID = @"D26D197E-4A1C-44AE-B504-DD7768870566";
//typedef struct {
//
//    int rsi;
//    int minor;
//    float i;
//}teststruct;

@interface ViewController ()
{
    float i;
    int firstindex;
    int secondindex;
    UILabel *lab;
    NSTimer *timer;
    CGFloat timeCount;
    CGFloat lapTimeCount;
    
}


@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLBeaconRegion *beaconRegion;
@property (nonatomic, strong) NSMutableString *mmp;
//@property (nonatomic,strong) NSMutableDictionary *tmp;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _text.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self    action:@selector(background:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer: tapGestureRecognizer];   //只需要点击非文字输入区域就会响应
    [tapGestureRecognizer setCancelsTouchesInView:NO];
    _text.clearsOnBeginEditing = YES;
   // [self.mmp insertString:@"minor,rssi,distance\n" atIndex:0];
     _mmp = [NSMutableString stringWithFormat:@"minor,rssi,diatance\n"];
    [self viewcreated];
    
}
-(void)viewcreated
{

    lab = [[UILabel alloc]init];
    lab.textColor = [UIColor whiteColor];
    lab.backgroundColor = [UIColor blackColor];
    lab.font = [UIFont boldSystemFontOfSize:23];
    lab.text = @" 00:00.00 ";
    [lab sizeToFit];
    lab.frame = CGRectMake(160 - lab.frame.size.width/2, 50, lab.frame.size.width, lab.frame.size.height);
    [self.view addSubview:lab];
   
}

- (void)startTimer
{
        [_lrBtn setTitle:@"save" forState:UIControlStateNormal];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        _lrBtn.enabled = YES;
   
}
- (void)resetTimer
{

    if (timer) {
        [timer invalidate];
    }
    lab.text = @" 00:00.0 ";
    timeCount = 0.0f;
    lapTimeCount = 0.0f;
    [_lrBtn setTitle:@"save" forState:UIControlStateNormal];
    _lrBtn.enabled = NO;
  
}
- (void)updateTimer
{
    timeCount += 0.1f;
    lapTimeCount += 0.1f;
    lab.text = [NSString stringWithFormat:@" %02d:%04.1f ",(int)(timeCount/60),timeCount-(60*(int)(timeCount/60))];
}

-(void)start
{
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    
}
- (void)initRegion
{
    if (_beaconRegion)
        return;
    NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:kUUID];
    //    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier:@"TongjiIdentifier"];
    _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier:@"TongjiIdentifier"];
    _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:proximityUUID major:1 identifier:@"TongjiIdentifier"];
}
-(NSMutableString*)mmp
{
	if(!_mmp){
		_mmp = [NSMutableString string];
	}

	return _mmp;
}
-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    
    for (CLBeacon *beacon in beacons) {
       firstindex = (int)beacon.rssi;
        NSLog(@"%d",firstindex);
//        NSString *first = [[NSString alloc]initWithFormat:@"%d",firstindex];
       secondindex = [[beacon minor] intValue];
//        NSString *second = [[NSString alloc]initWithFormat:@"%d",secondindex];
        
        NSString *row = [NSString stringWithFormat:@"%d,%d,%f\n",secondindex,firstindex,i];
        
    
//        [_tmp setObject:second forKey:@"minor"];
//        [_tmp setObject:first forKey:@"rssi"];
//        [_tmp setObject:stringi forKey:@"distance"];
        
//        teststruct s ;
//        s.rsi = (int)beacon.rssi;
//        s.minor =[[beacon minor] intValue];
//        NSValue *value = nil;
//        value = [NSValue valueWithBytes:&s objCType:@encode(teststruct)];
//        //NSString *stringInt = [NSString stringWithFormat:@"%d",firstindex];
//        //secondindex = [[beacon minor] intValue];
//        //NSString *minor = [NSString stringWithFormat:@"%d",secondindex];
//        NSLog(@"%f",s.i);
        [self.mmp appendFormat:@"%@",row];
        
//        //[self.mmp addObject:stringInt];
    }
    
    
        // Find documents directory
   
       //NSFileHandle *NSFileHandle = [NSFileHandle fileHandleForUpdatingAtPath:survey];
//        [NSFileHandle seekToEndOfFile];
//        [NSFileHandle writeData:[picRatings dataUsingEncoding:NSUTF8StringEncoding]];
//        [NSFileHandle closeFile];
//    NSString *picRatings = [NSString stringWithFormat:@"%@",self.mmp];
//    // Find documents directory
//    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *survey = [docPath stringByAppendingPathComponent:@"pic.csv"];
//    // Create new file if none exists
//    if (![[NSFileManager defaultManager] fileExistsAtPath:survey])
//    {
//        [[NSFileManager defaultManager] createFileAtPath:survey contents:nil attributes:nil];
//    }
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:survey];
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:[picRatings dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandle closeFile];
    
//    //NSLog(@"mmp: %@",_mmp);
//    NSFileManager *fm = [NSFileManager defaultManager];
//    
//    //找到Documents文件所在的路径
//    
//    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    //取得第一个Documents文件夹的路径
//    
//    NSString *filePath = [path objectAtIndex:0];
//    
//    //把TestPlist文件加入
//    
//    NSString *plistPath = [filePath stringByAppendingPathComponent:@"test.plist"];
//    
//    //开始创建文件
//    
//    [fm createFileAtPath:plistPath contents:nil attributes:nil];
//    
//    //删除文件
//    
//    [fm removeItemAtPath:plistPath error:nil];
//    [_mmp writeToFile:plistPath atomically:YES];
}
-(void)turningon
{

    [self initRegion];
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)stop
{
        [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
}
-(void)reFreshFile
{
    NSString *extension = @"csv";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *filename;
    while ((filename = [e nextObject])) {
        
        if ([[filename pathExtension] isEqualToString:extension]) {
            
            [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
        }
    }
    
}
- (IBAction)start:(id)sender {
    [self startTimer];
    [self reFreshFile];
    [self start];
    [self turningon];
}
-(void)saveFile
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *survey = [docPath stringByAppendingPathComponent:@"pic.csv"];
    // Create new file if none exists
    if (![[NSFileManager defaultManager] fileExistsAtPath:survey])
    {
        [[NSFileManager defaultManager] createFileAtPath:survey contents:nil attributes:nil];
    }
    
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:survey];
    [fileHandle seekToEndOfFile];
    
    [fileHandle writeData:[_mmp dataUsingEncoding:NSUTF8StringEncoding]];
    
    [fileHandle closeFile];
}
- (IBAction)stop:(id)sender {
    [self resetTimer];
    [self saveFile];
    [self stop];
    UIActionSheet * actionsheet=[[UIActionSheet alloc]
                                 initWithTitle:@"文件已储存在pic.csv中"
                                 delegate:self
                                 cancelButtonTitle:@"确定"
                                 destructiveButtonTitle:nil
                                 otherButtonTitles:nil];
    [actionsheet showInView:self.view];
}
- (IBAction)getdistance:(id)sender {
         i= [_text.text floatValue];
}

- (IBAction)background:(id)sender {
    [_text resignFirstResponder];
}
@end
