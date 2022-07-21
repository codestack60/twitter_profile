import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  final double? size;

  const MyAvatar({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[800]!,
              width: 2.0,
            ),
            shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            radius: size,
            backgroundImage: NetworkImage("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMoAAAD6CAMAAADXwSg3AAAAkFBMVEX///85zv0DVpsWuf0iy/32/f/7/f7f9f8IW54Atf0yzf0AUZkAt/00y/0AUJgAS5bx+/983P540v5H0f3v9Pjp+f+k5v4taaV73P6K3/6d5P70+Ptg1v1w2f5S0/2R4f6y6f4yv/0fr/Biibfa9P9uz/4eYqFdhrXO8f47wf2U2v4Gqu3m7PIAWZ1izf80bac7nreYAAAD8UlEQVR4nO3ciVIaYRAE4IVdUCExGHKo8Qox5tS8/9sF1IRjD/5j1pnp6nmDr7p7t7aooih4vM0bCd1srC25nAxErrrQpkhJJhfKkOICRoKTyWVFCSW9SbgTSiihhBJKKOlDcgUjYSZid8pMahL173iYduFIxHYCJNHeCSXIEmVIcQKTCSV1yUhZgrN4uUyUIdxJg0R7J5TUJTDtmsNIcDIB2gmMZI4j0d7JGUy7KAGWqC9eTgKzeJxMuBNKepRw8ZRQQgkllFBCSR93TUlNMqPEmmSA0y4cCUy7KLEn4eINSmDahSMZUEJJbxKcneBIcNpFiT0JdyJ255RQ4kDynhJzEpx2UWJPgrMTSiihhBJK4u+DlGSiLcHJBEci1i4cifpOKKlJcNpFiT1J0E5GB0J3W/+l+YUl80rozvqTBLVrNJD6O+NrbcncgSSoXTNKdk9dgtMuH5IDGMnLZlJ/nxQ3MpSXzqRBImQxIRGxGJEIWMxIsi2GJJkWU5Isy6QyJcmwGMskw2JQkmqx1q50i8VM0iw2M0mxWM0k3mI3k1hLmORKSnISJ4mxWJeEW4IkY7F2JUhCLR4kYZYgyUzGkS4J+dwPk3x+9VpZsj+X6jZMUpYSlhzJvlyCJKNyKZGw5Em6LWHtepLkW3IlXZbQnZSlhCVf0m4J34mERULSZomX5FhkJM2WsMVvS9It1amMpMkSlkm5I0m1yEnqlpR2pVskJbuWdEmKRWonTZYcSbxFWrJpiXnH51tk27VtyZXEWeQzWVvy2hVr6UfyZEl7n6Ra+pKsLDKSUEt/kqI4/y4jCbP0sfioC5KEWLxI9lv8SPZZPEm6LeqScYyky6Iuicqky+JP0mbxKGm2qEsid9Ju8SqpW9QlSe1qslSX2pIfyZJti2/JpkW9XeM8ydqinkmRvpNti7ok+dm1a1GXZO5kbUGRLC3aiy9+HslIyl+/tSnFWxnLYnj/TpsiY1kMh9MhhGUpWVoQcnmULC2H7i3PEgDLf4l7y4bE+fa3JK5z2ZE4ttQkbi0NEqeWRonLd+XivpniL5dWydJy58rSIXFmadmJw47tkTjafme7XOWyONwrcWIJyOTRYmD7X7stgZJVLp+0Kd2WYMlq+6YtERIbe2m1BC1+w2J3L5ESw5aodj1bbG4/QWJ0L9HterbY61iixKAlWWLPkrKTtcXQ9pMWv2Gx8xzLaNe/XPQ79nAkITFjEZDY2MtD5k4sWb68EaGY2L6YBSkXIMsxkGV6N9amsGPgluOPtJi0AG0fyoLUMSgLUsdosWkB2ssfpFz0Ld9owbYg7YUW0ZPrmLaEezFrGR6K3NSAZSx22hIej8fLvL/HgMzqjQoorwAAAABJRU5ErkJggg=="),
          ),
        ),
      ),
    );
  }
}
