/*CustomScrollView(
slivers: <Widget>[
//first one
SliverAppBar(
title: Text(
'Sliver App',
style: TextStyle(
fontSize: 25.0,
color: Colors.white,
),
),
expandedHeight: 400.0,
backgroundColor: Colors.blueGrey[900],
flexibleSpace: FlexibleSpaceBar(
background: Image(
image: NetworkImage(
'https://image.freepik.com/free-vector/cute-sloth-thickets-tropical-plants_163454-554.jpg'),
fit: BoxFit.cover,
),
),
),

//Second One
SliverList(
delegate: SliverChildBuilderDelegate(
(BuildContext context, int index) {
return Container(
color: color,
height: 100.0,
);
},
childCount: 100,
),
)
],
);
}
}
*/
