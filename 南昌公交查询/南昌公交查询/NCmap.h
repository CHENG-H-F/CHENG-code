#pragma once
#include <iostream>
#include <string>
#include <fstream>
#include <cassert>
#include <sstream>
#include "Stack.h"
#define MAXvexs 200//�ϲ����վ����
#define MAXdistance 9999//��ʾ�����
#define MAXstation 99//���������վ����
#define MAXbus 99//�����������
using namespace std;
struct Bus
{
	string busname;//������
	string station[MAXstation];//����վ����
	int stationnum;//����վ��
};//ÿ����������Ϣ
class NCmap
{
public:
	NCmap();//��ʼ��
	void Init();//�ϲ��е�վ��͹�������Ϣ����
	void ReadStation(string file, int m, string way);//��ȡ�ı��и���������վ�������
	void Inittxt(string file);//���㹫������busnum�͹���վ��
	void ReadNCstation(string file);//��ȡ�ı��ϲ�����վ����վ������
	void ReadNCdistance(string file);//��ȡ�ı���ȡ�ڽ�մ��ľ���
	int StationSearch(string);//����վ��������±�
	string StationSearchback(int);//����վ�������վ��
	void QueryBusStation(string);//���빫��·�ߺţ���ѯ�ù�����·��������վ��
	int* QueryBus(string);//����վ�����ƣ���ѯ����Щ������·�Ӹ�վ�㾭��
	int* QueryNearBus(int, int);//����2��վ���±꣬��ѯ��Щ������·����������վ�㣬����������վ������
	void DIJ(string, string, int*&, int&, float&);//���������������·��,����·����·��վ�������·������
	void QueryWay(string, string);//���������յ���������վ�㣬��ѯ��γ���������
	void QueryOwnWay(string, string, string);//������㡢�յ��Լ�����;���Ĺ���վ�㣬��ѯ��γ�����������
	void display();//������ı���ȡ�Ĺ�����������Ϣ
private:
	string vexs[MAXvexs];//�����ϲ���վ����Ϣ
	float arcs[MAXvexs][MAXvexs];//�����ڽ�վ��ľ���
	int vexsnum;//�ϲ�����վ����
	Bus bus[MAXbus];//�ϲ��й�������Ϣ
	int busnum;//�ϲ��й���������
};
NCmap::NCmap()
{
	for (int i = 0; i < MAXvexs; i++)
	{
		vexs[i] = "��";
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
		bus[i].busname = "��";
		bus[i].stationnum = 0;
		for (int j = 0; j < MAXstation; j++)
		{
			bus[i].station[j] = "��";
		}
	}
	busnum = 0;
}
void NCmap::ReadStation(string file, int m, string busname)
{
	int n = 1;
	ifstream infile;
	infile.open(file.data());     //���ļ����������ļ��������� 
	assert(infile.is_open());   //��ʧ��,�����������Ϣ,����ֹ�������� 
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
	infile.close();             //�ر��ļ������� 
}
void NCmap::Inittxt(string file)//���ڱ����ı�������¼�ı����湫��������������ÿ��������վ��������ÿ������������
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
			busnum++;//ÿ�λ�ȡ��#���򹫽�������1����¼��������
		}
	}
	infile.clear();
	infile.seekg(0, ios::beg);//���ļ�λ������ָ���һ��
	for (int i = 1; i <= busnum; i++)//��¼ÿ��������վ����
	{
		bus[i].stationnum--;//���Լ�����Ϊ������ʱ������һ��
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
	infile.seekg(0, ios::beg);//���ļ�λ������ָ���һ��
	for (int j = 1; j <= busnum; j++)
	{
		getline(infile, s);
		bus[j].busname = s;
		while (getline(infile, s))//������ȡ
		{
			if (s == "#")//������#ʱ�˳�ѭ�����������ѭ��
			{
				break;
			}
		}
	}
	infile.close();             //�ر��ļ������� 
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
	infile.close();             //�ر��ļ������� 
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
	infile.close();             //�ر��ļ������� 
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
					cout << "��" << endl;
				}
			}
		}
	}
	if (a == 0)
	{
		cout << "�޴˹������������ʽ����";
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
	cout << "����" << p << "վ��Ĺ�������:";
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
		cout << "�޸�վ�㣡";
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
	int D[MAXvexs][MAXvexs];//��¼���·���ĳ���
	int Path[MAXvexs][MAXvexs];//��¼·�������һ�������ǰһ�����㣬��ǰ��
	LinkStack L;
	//��ʼ��
	for (int i = 1; i <= vexsnum; i++)
	{
		for (int j = 1; j <= vexsnum; j++)
		{
			D[i][j] = arcs[i][j];
			if (D[i][j] < MAXdistance && i != j)
			{
				Path[i][j] = i;//���i��j���л�������j��ǰ��Ϊi
			}
			else
			{
				Path[i][j] = -1;//��������û�л�����ǰ��Ϊ-1����ʾû��ǰ��
			}
		}
	}

	for (int k = 1; k <= vexsnum; k++)
	{
		for (int i = 1; i <= vexsnum; i++)
		{
			for (int j = 1; j <= vexsnum; j++)
			{
				if (D[i][k] + D[k][j] < D[i][j])//�����i��k��j��һ��·������
				{
					D[i][j] = D[i][k] + D[k][j];//�����D[i][j],�������·������
					Path[i][j] = Path[k][j];//�����Path[i][j]ΪPath[k][j]������j��ǰ����Ϊk
				}
			}
		}
	}

	int i = StationSearch(p);
	int j = StationSearch(q);
	int n = 1;
	if (Path[i][j] != -1)
	{
		l = D[i][j];//���·���Ĵ�С
		while (i != j)//i��=j��ʱ����ջ
		{
			L.Push(j);
			j = Path[i][j];
		}
		L.Push(i);
		while (!L.Empty())//ջ��Ϊ�ճ�ջ
		{

			b[n] = L.Pop();
			n++;
		}
		m = n - 1;
		b[0] = 0;
	}
	else
	{
		cout << "�޳˳���������" << endl;
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
				cout << "���ų��з���" << i << ":" << endl;
				int y = busbegin[i];
				cout << "��" << bus[busbegin[i]].busname << ":" << StationSearchback(b[p1]) << "--->" << StationSearchback(b[q1]);
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
									cout << "(������" << bus[Needbus[n][k]].busname << ":" << StationSearchback(b[p1]) << "--->" << StationSearchback(b[q1]) << ")" << endl;
								}
								else
								{
									cout << endl << "����" << bus[Needbus[n][k]].busname << ":" << StationSearchback(b[p1]) << "--->" << StationSearchback(b[q1]);
									y = Needbus[n][k];
								}
								u++;
							}
						}
					}
					n++;
				}
				cout << endl << "�ܹ�����" << m << "��վ�㣬" << "��·��Ϊ:" << l << "�ס�" << endl << endl;
			}
		}
		delete b;
	}
	else
	{
		cout << "�޳��з�����";
	}
}
void NCmap::QueryOwnWay(string p, string q, string r)
{
	cout << "��" << p << "����" << endl;
	QueryWay(p, r);
	cout << "����ָ��վ��" << "�ٴ�" << r << "����" << endl;
	QueryWay(r, q);
}
void NCmap::display()
{
	cout << "��ͳ��" << busnum << "������·�ߡ�" << endl;
	cout << "�ֱ��ǣ�";
	for (int i = 1; i <= busnum; i++)
	{
		cout << bus[i].busname << " ";
	}
	cout << endl;
}