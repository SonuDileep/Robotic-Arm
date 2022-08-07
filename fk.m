% Forward Kinematics

function [x,y] = fk(n,l,theta)
    x = 0.0;
    y = 0.0;
    totalangle = 0.0;
    for i = 1:n
        totalangle = totalangle + theta(i);
        x = x + l(i)*cos(totalangle);
        y = y + l(i)*sin(totalangle);
    end
end