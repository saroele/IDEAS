within IDEAS.Buildings.Validation.Data.Constructions;
model LightWall_195 "BESTEST Light wall"

  extends IDEAS.Buildings.Data.Interfaces.Construction(
    final nLay=3,
    final locGain=2,
    final mats={Materials.WoodSiding_195(d=0.009),insulationType,
        Materials.PlasterBoard(d=0.012)});

end LightWall_195;
