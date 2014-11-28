within IDEAS.Buildings.Data.Constructions;
record OuterWall
  "Example - Classic cavity wall construction with fully-filled cavity"

  extends IDEAS.Buildings.Data.Interfaces.Construction(
    nLay=3,
    locGain=2,
    final mats={Materials.BrickMe(d=0.08),Materials.BrickMi(d=
        0.14),Materials.Gypsum(d=0.015)});

end OuterWall;
