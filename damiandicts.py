
d1={'name':'damian', 'number':'0870673903'}
d2={'name':'siobhan', 'number':'0876870880'}
d3={'name':'gary', 'number':'0864072034'}


l=[d1,d2,d3]

print(sorted(l, key=lambda i: i['number']))

