#pragma once
#include <iostream>
#include <string>
#include <fstream>
#include <cassert>
#include <sstream>
#include "Stack.h"
#define MAXvexs 200//南昌最大站点数
#define MAXdistance 9999//表示无穷大
#define MAXstation 99//公交车最大站点数
#define MAXbus 99//公交车最大数
using namespace std;
struct Bus
{
	string busname;//公交名
	string station[MAXstation];//公交站数组
	int stationnum;//公交站数
};//每个公交车信息
class NCmap
{
public:
	NCmap();//初始化
	void Init();//南昌市的站点和公交车信息储存
	void ReadStation(string file, int m, string way);//读取文本中各个公交车站点的数据
	void Inittxt(string file);//计算公交条数busnum和公交站数
	void ReadNCstation(string file);//获取文本南昌公交站所有站点数据
	void ReadNCdistance(string file);//读取文本获取邻接沾点的距离
	int StationSearch(string);//返回站点的数组下标
	string StationSearchback(int);//返回站点数组的站点
	void QueryBusStation(string);//输入公交路线号，查询该公交线路所经过的站点
	int* QueryBus(string);//输入站点名称，查询有哪些公交线路从该站点经过
	int* QueryNearBus(int, int);//输入2个站点下标，查询哪些公交线路经过这两个站点，并且这两个站点连着
	void DIJ(string, string, int*&, int&, float&);//无向网求两点最短路径,返回路径和路径站点个数和路径长度
	void QueryWay(string, string);//输入起点和终点两个公交站点，查询如何乘坐公交车
	void QueryOwnWay(string, string, string);//输入起点、终点以及必须途经的公交站点，查询如何乘坐公交车。
	void display();//输出从文本读取的公交车数量信息
private:
	string vexs[MAXvexs];//储存南昌市站点信息
	float arcs[MAXvexs][MAXvexs];//储存邻接站点的距离
	int vexsnum;//南昌市总站点数
	Bus bus[MAXbus];//南昌市公交车信息
	int busnum;//南昌市公交车条数
};
NCmap::NCmap()
{
	for (int i = 0; i < MAXvexs; i++)
	{
		vexs[i] = "空";
	}
	for (int i = 0; i < MAXvexs; i++)
	{
		for (int j = 0; j < MAXvexs; j++)
		{
			arcs[i][j] = MAXdistance;
		}
	}
	vexsnum = 0;
	for (int i = 0; i < MAXbus; i++)
	{
		bus[i].busname = "空";
		bus[i].stationnum = 0;
		for (int j = 0; j < MAXstation; j++)
		{
			bus[i].station[j] = "空";
		}
	}
	busnum = 0;
}
void NCmap::ReadStation(string file, int m, string busname)
{
	int n = 1;
	ifstream infile;
	infile.open(file.data());     //将文件流对象与文件连接起来 
	assert(infile.is_open());   //若失败,则输出错误消息,并终止程序运行 
	string s;
	while (getline(infile, s))
	{
		if (s == busname)
		{
			while (s != "#")
			{
				/*streampos sp = infile.tellg();
				infile.seekg(sp);*/
				getline(infile, s);
				if (s != "#")
				{
					bus[m].station[n] = s;
					n++;
				}
			}
			break;
		}

	}
	infile.close();             //关闭文件输入流 
}
void NCmap::Inittxt(string file)//用于遍历文本，并记录文本里面公交的条数，还有每条公交的站点数还有每条公交的名字
{
	int n = 0;
	ifstream infile;
	infile.open(file.data());
	assert(infile.is_open());
	string s;
	while (getline(infile, s))
	{
		if (s == "#")
		{
			busnum++;//每次获取到#，则公交条数加1，记录公交条数
		}
	}
	infile.clear();
	infile.seekg(0, ios::beg);//让文件位置重新指向第一行
	for (int i = 1; i <= busnum; i++)//记录每条公交的站点数
	{
		bus[i].stationnum--;//先自减，因为计数的时候多加了一个
		while (getline(infile, s))
		{
			if (s == "#")
			{
				break;
			}
			bus[i].stationnum++;
		}
	}
	infile.clear();
	infile.seekg(0, ios::beg);//让文件位置重新指向第一行
	for (int j = 1; j <= busnum; j++)
	{
		getline(infile, s);
		bus[j].busname = s;
		while (getline(infile, s))//继续读取
		{
			if (s == "#")//当遇到#时退出循环，进入外层循环
			{
				break;
			}
		}
	}
	infile.close();             //关闭文件输入流 
}
void NCmap::ReadNCstation(string file)
{
	int n = 0;
	ifstream infile;
	infile.open(file.data());
	assert(infile.is_open());
	string s;
	while (getline(infile, s))
	{
		n++;
		vexs[n] = s;
	}
	vexsnum = n;
	infile.close();             //关闭文件输入流 
}
void NCmap::ReadNCdistance(string file)
{
	ifstream infile;
	infile.open(file.data());
	assert(infile.is_open());
	string s;
	float c;
	while (getline(infile, s))
	{
		int i = StationSearch(s);
		getline(infile, s);
		int j = StationSearch(s);
		getline(infile, s);
		c = 0;
		stringstream stream;
		stream << s;
		stream >> c;
		arcs[i][j] = c;
		arcs[j][i] = c;
	}
	infile.close();             //关闭文件输入流 
}
int NCmap::StationSearch(string s)
{
	for (int i = 1; i <= vexsnum; i++)
	{
		if (s == vexs[i])
		{
			return i;
		}
	}
}
string NCmap::StationSearchback(int p)
{
	for (int i = 1; i <= vexsnum; i++)
	{
		if (vexs[p] == vexs[i])
		{
			return vexs[i];
		}
	}
}
void NCmap::Init()
{
	Inittxt("BusData.txt");
	for (int i = 1; i <= busnum; i++)
	{
		ReadStation("BusData.txt", i, bus[i].busname);
	}
	ReadNCstation("NCstation.txt");
	ReadNCdistance("NCdistance.txt");
}
void NCmap::QueryBusStation(string p)
{
	int a = 0;
	for (int i = 1; i <= busnum; i++)
	{
		if (bus[i].busname == p)
		{
			a++;
			cout << bus[i].busname << ":" <<endl;
			for (int j = 1; j <= bus[i].stationnum; j++)
			{
				cout << bus[i].station[j];
				if (j != bus[i].stationnum)
				{
					cout << "--->";
				}
				else
				{
					cout << "。" << endl;
				}
			}
		}
	}
	if (a == 0)
	{
		cout << "无此公交车或输入格式错误！";
	}
	cout << endl;
}
int* NCmap::QueryBus(string p)
{
	int n = 1;
	int* a = new int[busnum];
	for (int i = 1; i <= busnum; i++)
	{
		a[i] = 0;
	}
	cout << "经过" << p << "站点的公交车有:";
	for (int i = 1; i <= busnum; i++)
	{
		for (int j = 1; j <= bus[i].stationnum; j++)
		{
			if (p == bus[i].station[j])
			{
				cout << bus[i].busname << " ";
				a[n++] = i;
			}
		}
	}
	if (n == 1)
	{
		cout << "无该站点！";
	}
	cout << endl << endl;
	return a;
}
int* NCmap::QueryNearBus(int p, int q)
{
	int* a = new int[busnum];
	int n = 1;
	for (int i = 1; i <= busnum; i++)
	{
		a[i] = 0;
	}
	for (int i = 1; i <= busnum; i++)
	{
		for (int j = 1; j <= bus[i].stationnum; j++)
		{
			if (StationSearchback(p) == bus[i].station[j] && StationSearchback(q) == bus[i].station[j + 1])
			{
				a[n++] = i;
			}
			if (StationSearchback(p) == bus[i].station[j] && StationSearchback(q) == bus[i].station[j - 1])
			{
				a[n++] = i;
			}
		}
	}
	return a;
}
void NCmap::DIJ(string p, string q, int*& b, int& m, float& l)
{
	int D[MAXvexs][MAXvexs];//记录最短路径的长度
	int Path[MAXvexs][MAXvexs];//记录路径上最后一个顶点的前一个顶点，即前驱
	LinkStack L;
	//初始化
	for (int i = 1; i <= vexsnum; i++)
	{
		for (int j = 1; j <= vexsnum; j++)
		{
			D[i][j] = arcs[i][j];
			if (D[i][j] < MAXdistance && i != j)
			{
				Path[i][j] = i;//如果i和j间有弧，则令j的前驱为i
			}
			else
			{
				Path[i][j] = -1;//如果两点间没有弧，则前驱为-1，表示没有前驱
			}
		}
	}

	for (int k = 1; k <= vexsnum; k++)
	{
		for (int i = 1; i <= vexsnum; i++)
		{
			for (int j = 1; j <= vexsnum; j++)
			{
				if (D[i][k] + D[k][j] < D[i][j])//如果从i经k到j的一条路径更短
				{
					D[i][j] = D[i][k] + D[k][j];//则跟新D[i][j],更新最短路径长度
					Path[i][j] = Path[k][j];//则更新Path[i][j]为Path[k][j]，即将j的前驱换为k
				}
			}
		}
	}

	int i = StationSearch(p);
	int j = StationSearch(q);
	int n = 1;
	if (Path[i][j] != -1)
	{
		l = D[i][j];//最短路径的大小
		while (i != j)//i！=j的时候入栈
		{
			L.Push(j);
			j = Path[i][j];
		}
		L.Push(i);
		while (!L.Empty())//栈不为空出栈
		{

			b[n] = L.Pop();
			n++;
		}
		m = n - 1;
		b[0] = 0;
	}
	else
	{
		cout << "无乘车方案！！" << endl;
		b[0] = 1;
	}
}
void NCmap::QueryWay(string p, string q)
{
	int* b = new int[MAXvexs];
	for (int i = 0; i < MAXvexs; i++)
	{
		b[i] = 0;
	}
	int m = 0;
	float l = 0;
	DIJ(p, q, b, m, l);
	if (b[0] == 0)
	{
		int p1 = 1, q1 = 2;
		int* busbegin = QueryNearBus(b[p1], b[q1]);
		int** Needbus = new int*[MAXvexs];
		for (int i = 0; i < MAXvexs; i++)
		{
			Needbus[i] = new int[busnum + 1];
		}
		for (int i = 0; i < MAXvexs; i++)
		{
			for (int j = 0; j <= busnum; j++)
			{
				Needbus[i][j] = 0;
			}
		}
		int n = 1;
		for (int i = 1; i <= busnum; i++)
		{
			p1 = 1;
			q1 = 2;
			if (busbegin[i] != 0)
			{
				cout << "最优出行方案" << i << ":" << endl;
				int y = busbegin[i];
				cout << "坐" << bus[busbegin[i]].busname << ":" << StationSearchback(b[p1]) << "--->" << StationSearchback(b[q1]);
				for (int j = 2; j < m; j++)
				{
					Needbus[n] = QueryNearBus(b[++p1], b[++q1]);
					int u = 0;
					for (int k = 1; k <= busnum; k++)
					{
						if (Needbus[n][k] != 0 )
						{
							for (int l = 1; l <= busnum; l++)
							{
								if (Needbus[n][l] == y && u == 0)
								{
									cout << "--->" << StationSearchback(b[q1]);
									u++;
								}
							}
							if (Needbus[n][k] != y)
							{
								if (u != 0)
								{
									cout << "(或者坐" << bus[Needbus[n][k]].busname << ":" << StationSearchback(b[p1]) << "--->" << StationSearchback(b[q1]) << ")" << endl;
								}
								else
								{
									cout << endl << "再坐" << bus[Needbus[n][k]].busname << ":" << StationSearchback(b[p1]) << "--->" << StationSearchback(b[q1]);
									y = Needbus[n][k];
								}
								u++;
							}
						}
					}
					n++;
				}
				cout << endl << "总共经过" << m << "个站点，" << "总路程为:" << l << "米。" << endl << endl;
			}
		}
		delete b;
	}
	else
	{
		cout << "无出行方案！";
	}
}
void NCmap::QueryOwnWay(string p, string q, string r)
{
	cout << "从" << p << "出发" << endl;
	QueryWay(p, r);
	cout << "到达指定站点" << "再从" << r << "出发" << endl;
	QueryWay(r, q);
}
void NCmap::display()
{
	cout << "共统计" << busnum << "条公交路线。" << endl;
	cout << "分别是：";
	for (int i = 1; i <= busnum; i++)
	{
		cout << bus[i].busname << " ";
	}
	cout << endl;
}