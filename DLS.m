%DLS

function angle= DLS(n,m,lambda,l,theta,xd,yd)
    angle = [];
    for i = 1:m
       err = true;
       iter = 0;
       errL = 0.0001; 
       while err
           iter = iter + 1;
          [xa,ya] = fk(n,l,theta);           
           
           xerror = xd(i) - xa;
           yerror = yd(i) - ya;
           deltaX = [xerror;yerror];
           J = jacobian(n, l, theta); 
           JT = transpose(J);
           I = eye(2); 
           delT = JT*(J*JT+lambda^2*I)^(-1)*deltaX;
           delT = transpose(delT);
           theta = theta + delT;
           err = norm(delT);
           if err < errL
              err=false; 
           end
           if iter > 20
               iter = 0;
               errL = errL * 2; 
           end
       end
       angle = [angle ; theta];
    end
end