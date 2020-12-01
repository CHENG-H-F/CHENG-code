#pragma once
#include <iostream>
struct Node {
	int data;
	struct Node * next;
};
class LinkStack {
public:
	LinkStack() { top = NULL; }
	~LinkStack();
	void Push(int x);
	int Pop();
	int GetTop();
	bool Empty() { return (NULL == top) ? true : false; }
private:
	struct Node *top;
};
void LinkStack::Push(int x) {
	struct Node * p = new Node;
	p->data = x;
	p->next = top;
	top = p;
}
int LinkStack::Pop() {
	if (Empty()) throw "����";
	int x = top->data;
	struct Node * p = top;
	top = top->next;
	delete p;
	return x;
}
LinkStack::~LinkStack() {
	while (top) {
		struct Node *p = top;
		top = top->next;
		delete p;
	}
}
int LinkStack::GetTop() {
	if (Empty()) throw "���";
	return top->data;
}
