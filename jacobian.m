% Jacobian

function J = jacobian(n, l, theta)
    d = 0.0; 
    atheta = 0.0; 
    J = zeros(3,n);
    A = [1,0,0,0; 
        0,1,0,0; 
        0,0,1,0; 
        0,0,0,1];
    
    for i=n:-1:1 
        ll = l(i);
        angle = theta(i);
        A1 = [cos(angle),-cos(atheta)*sin(angle),sin(atheta)*sin(angle),ll*cos(angle);
            sin(angle),cos(atheta)*cos(angle),-sin(atheta)*cos(angle),ll*sin(angle);
            0,sin(atheta),cos(atheta),d; 
            0,0,0,1];
        
        A = A1*A; 
        a = A(1:3,3); 
        p = A(1:3,4);
        j1 = cross(a,p);
        J(:,i) = j1;
    end
    J = J(1:2,:); 
    disp(J)
end