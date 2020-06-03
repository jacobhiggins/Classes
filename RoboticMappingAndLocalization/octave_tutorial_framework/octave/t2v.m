function v = t2v(M)
    x = M(1,3);
    y = M(2,3);
    theta = atan2(M(2,1),M(2,2));
    v = [x;y;theta];
end