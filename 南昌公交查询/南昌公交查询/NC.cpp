#include <iostream>
#include "NCmap.h"
#include <string>
using namespace std;
void main()
{
	cout << endl << "------------------------------欢迎使用南昌市公交线路查询模拟系统------------------------------" << endl << endl;
	NCmap nc;
	nc.Init();
	string p = "空", q = "空", r = "空", s = "空", t = "空";
	nc.display();
	do
	{
		do
		{
			if ( p != "空" && p != "是" && p != "否" )
			{
				cout << "输入格式错误，请输入是或否。" << endl;
			}
			cout << "是否需要查询公交车信息（是或否）：";
			cin >> p;
		} while ( p != "是" && p != "否" );
		if (p == "是")
		{
			cout << "请输入你想查询的公交车(例如214路)：";
			cin >> q;
			nc.QueryBusStation(q);
		}
		cout << endl;
	} while ( p == "是");
	p = "空";
	do
	{
		do
		{
			if (p != "空" && p != "是" && p != "否")
			{
				cout << "输入格式错误，请输入是或否。" << endl;
			}
			cout << "是否要查询经过某站点的公交车（是或否）：";
			cin >> p;
		} while (p != "是" && p != "否");
		if (p == "是")
		{
			cout << "请输入你想查询的站点：";
			cin >> q;
			nc.QueryBus(q);
		}
	} while (p == "是");
	cout << endl;
	p = "空";
	do
	{
		do
		{
			if (p != "空" && p != "是" && p != "否")
			{
				cout << "输入格式错误，请输入是或否。" << endl;
			}
			cout << "是否要查询如何乘坐公交车（是或否）：";
			cin >> p;
		} while (p != "是" && p != "否");
		if (p == "是")
		{
			cout << "是否要指定一个途径站点（是或否）：";
			cin >> s;
			do
			{
				if (s != "空" && s != "是" && s != "否")
				{
					cout << "输入格式错误，请输入是或否。" << endl;
				}
				else
				{
					if (s == "是")
					{
						cout << "请输入你的出发站点：";
						cin >> r;
						cout << "请输入你的目的地：";
						cin >> q;
						cout << "请输入途径站点：";
						cin >> t;
						nc.QueryOwnWay(r, q, t);
					}
					else
					{
						cout << "请输入你的出发站点：";
						cin >> r;
						cout << "请输入你的目的地：";
						cin >> q;
						nc.QueryWay(r, q);
					}
				}
			} while (p != "是" && p != "否");
		}
	} while (p == "是");
	cout << endl << "------------------------------------------谢谢使用！------------------------------------------" <<endl;
	system("pause");
}
