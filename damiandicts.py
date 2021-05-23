def sort_list():
    d1={'name':'damian', 'number':'0870673903'}
    d3={'name':'gary', 'number':'0864072034'}
    d2={'name':'siobhan', 'number':'0876870880'}

    l=[d1,d2,d3]
    return(sorted(l, key=lambda i: i['number']))

