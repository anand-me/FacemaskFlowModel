function [x_face, y_face, z_face] = decoupleFM(combined, Lface)

x_face = combined(1:Lface);
y_face = combined(Lface+1:2*Lface);
z_face = combined(2*Lface+1:3*Lface);

end