//
//  ViewController.m
//  fmdb
//
//  Created by 李龙 on 15/12/27.
//  Copyright © 2015年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Book.h"
#import "BookInfo.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建上下文
    [self createCoreDataContent];
    
}


- (IBAction)createCoreDataContent{
    //创建数据库文件的路径
    //    NSString *path = [NSHomeDirectory() stringByAppendingString:@"Doucments/ImortData"];
    //    NSFileManager *manager = [NSFileManager defaultManager];
    //    if (![manager fileExistsAtPath:path]) {
    //        [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    //    }
    //
    
    //documet目录下
    NSString *doc  = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"/student.db"];//注意不是:stringByAppendingString
    
    NSURL *url = [NSURL fileURLWithPath:path];
    NSLog(@"-----------------------------------");
    NSLog(@"data : %@",path);
    
    //创建文件,并且打开数据库文件
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    //给存储器指定存储的类型
    NSError *error;
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    if (store == nil) {
        [NSException raise:@"添加数据库错误" format:@"%@",[error localizedDescription]];
    }
    
    
    //创建图形上下文
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    context.persistentStoreCoordinator = psc;
    self.managedContext = context;
}


//// 添加数据
//- (IBAction)addData:(id)sender {
//    // 从托管对象上下文中获取BookData名对应的Entity对象
//    NSManagedObjectContext *context = [self.myDelegate managedObjectContext];
//    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"BookData" inManagedObjectContext:context];
//    BookData *bd = [[BookData alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:context];
//
//    // 设置要保存的数据
//    Book *book = [[Book alloc] init];
//    NSDictionary *dic = @{@"name": self.name_textField.text,
//                          @"charsPerPage": self.cpp_textField.text
//                          };
//    book.info = [dic mutableCopy]; // 设置book的字典info
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:book]; // 对book对象进行归档
//    bd.book = data; // 设置bd的book对象（NSData类型）
//
//    // 保存数据到托管对象上下文中
//    NSError *error = nil;
//    BOOL isSaveSuccess = [context save:&error];
//    if (isSaveSuccess) {
//        NSLog(@"Save succeed");
//    }
//    else {
//        NSLog(@"%@", error);
//    }
//}


//插入数据
- (IBAction)insertData{
    NSLog(@"插入数据");
    
    //====== 3'
    //第一组数据
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedContext];
    student.name = @"张三2";
    student.id = @(11);
    
    BookInfo *book =  [[BookInfo alloc] init];
    book.bookID = @(121);
    book.bookName = @"<老人与海2>";
    
    BookInfo *book1 =  [[BookInfo alloc] init];
    book1.bookID = @(121);
    book1.bookName = @"<老人与海2>";
    
    student.penDict = @{@"book":book,@"book1":book1};
    
    
    //第二组数据
    Student *student2 = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedContext];
    student2.name = @"李四2";
    student2.id = @(23);
    
    BookInfo *book2 = [[BookInfo alloc] init];
    book2.bookID = @(242);
    book2.bookName = @"<飞鸟集2222>";
    
    BookInfo *book22 =  [[BookInfo alloc] init];
    book22.bookID = @(242);
    book22.bookName = @"<飞鸟集22222>";
    
    student2.penDict = @{@"book2":book2,@"book22":book22};
    
    
    
    
    
    //====== 1'
    //    创建模型数据模型 ,这样存是不行的
    //    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedContext];
    //    student.name = @"张三2";
    //    student.id = @(11);
    //
    //    Book *book = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.managedContext];
    //    book.bookID = @(121);
    //    book.bookName = @"<老人与海2>";
    //    student.book = book;
    //
    //    Book *book1 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.managedContext];
    //    book1.bookID = @(121);
    //    book1.bookName = @"<老人与海2>";
    //
    //    student.penDict = @{@"book":book,@"book1":book1};
    //
    //
    //    //第二组数据
    //    Student *student2 = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedContext];
    //    student2.name = @"李四2";
    //    student2.id = @(23);
    //
    //    Book *book2 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.managedContext];
    //    book2.bookID = @(242);
    //    book2.bookName = @"<飞鸟集2222>";
    //    student2.book = book2;
    //
    //    Book *book22 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.managedContext];
    //    book22.bookID = @(242);
    //    book22.bookName = @"<飞鸟集22222>";
    //
    //    student.penDict = @{@"book":book2,@"book1":book22};
    
    
    //保存,用 save 方法
    NSError *error = nil;
    BOOL success = [self.managedContext save:&error];
    if (!success) {
        [NSException raise:@"访问数据库错误" format:@"%@",[error localizedDescription]];
    }
    
}


//更新数据
- (IBAction)modifyData{
    // 如果是想做更新操作：只要在更改了实体对象的属性后调用[context save:&error]，就能将更改的数据同步到数据库
    //先从数据库中取出所有的数据,然后从其中选出要修改的那个,进行修改,然后保存
    
    //以上代码简写成下边
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    //设置过滤条件
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name = %@",@"李四2"];
    request.predicate = pre;
    
    NSError *error = nil;
    NSArray *objs = [self.managedContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    // 2.更新身高
    for (Student *stu in objs) {
        stu.name = @"被修改的新名字";
    }
    
    
    //保存,用 save 方法
    BOOL success = [self.managedContext save:&error];
    if (!success) {
        [NSException raise:@"访问数据库错误" format:@"%@",[error localizedDescription]];
    }
    
}

//读取数据库文件
- (IBAction)readData{
    NSLog(@"读取数据");
    dispatch_async(dispatch_get_main_queue(), ^{
        
        // 初始化一个查询请求
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        // 设置要查询的实体
        request.entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:self.managedContext];
        
        //以上代码简写成下边
        //        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
        
        // 设置排序（按照age降序）
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"id" ascending:NO];
        request.sortDescriptors = [NSArray arrayWithObject:sort];
        // 设置条件过滤(搜索name中包含字                                                                                                                                                                                 串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%Itcast-1%应该写成*Itcast-1*)
        //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like %@", @"*Itcast-1*"];
        //    request.predicate = predicate;
        
        // 执行请求
        NSError *error = nil;
        NSArray *objs = [self.managedContext executeFetchRequest:request error:&error];
        if (error) {
            [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
        }
        
        NSLog(@"-----------------------------------");
        // 遍历数据
        int index = 0;
        for (Student *stu in objs) {
            NSLog(@"student:%d---name=%@", index++,stu.name);
            NSDictionary *dict = stu.penDict;
            NSLog(@"dict : %@",dict);
            Book *book2 = dict[@"book2"];
            Book *book22 = dict[@"book22"];
            NSLog(@"-book2'name:%@----book22'name%@",book2.bookName,book22.bookName);
            
        }
    });
}


- (IBAction)removeData:(id)sender{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    NSPredicate *predic = [NSPredicate predicateWithFormat:@"name = %@",@"张三2"];
    request.predicate = predic;
    
    //请求数据
    NSArray *objs = [self.managedContext executeFetchRequest:request error:nil];
    
    for (Student *stu in objs) {
        [self.managedContext deleteObject:stu];
    }
    
    [self.managedContext save:nil];
}




@end
