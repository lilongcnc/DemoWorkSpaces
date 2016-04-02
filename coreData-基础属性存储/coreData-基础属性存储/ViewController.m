//
//  ViewController.m
//  coreData-基础属性存储
//
//  Created by 李龙 on 16/4/2.
//  Copyright © 2016年 lauren. All rights reserved.
//


#import "ViewController.h"
#import "Student.h"
#import "Book.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建上下文
    [self createCoreDataContent];
    
    //    //插入一组模型数据
    ////    [self insertData];
    ////
    ////    //更新一组数据
    ////    [self modifyData];
    //
    //    [self readData];
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


//插入数据
- (IBAction)insertData{
    NSLog(@"插入数据");
    //创建模型数据模型
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedContext];
    student.name = @"张三2";
    student.id = @(11);
    
    Book *book = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.managedContext];
    book.bookID = @(121);
    book.bookName = @"<老人与海2>";
    
    student.book = book;
    
    Student *student2 = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedContext];
    student2.name = @"李四2";
    student2.id = @(23);
    
    Book *book2 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.managedContext];
    book2.bookID = @(242);
    book2.bookName = @"<飞鸟集2>";
    
    student2.book = book2;
    
    
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
        //        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        //        // 设置要查询的实体
        //        request.entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:self.managedContext];
        
        //以上代码简写成下边
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
        
        // 设置排序（按照age降序）
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"id" ascending:NO];
        request.sortDescriptors = [NSArray arrayWithObject:sort];
        // 设置条件过滤(搜索name中包含字符串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%Itcast-1%应该写成*Itcast-1*)
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
        for (NSManagedObject *obj in objs) {
            NSLog(@"%d---name=%@", index++,[obj valueForKey:@"name"]);
        }
        
        for (Student *stu in objs) {
            Book *book = stu.book;
            NSLog(@"%@---name=%@", stu.name,book.bookName);
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
