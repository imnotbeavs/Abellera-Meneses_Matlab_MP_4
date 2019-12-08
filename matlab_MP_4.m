function[] = matlab_MP_4()
clc
format short g
height = input('Initial HEIGHT of the projectile ABOVE the ground in meters: ');
velocity = input('Magnitude of the VELOCITY in m/s: ');
theta = input('ANGLE in degrees with respect to the + X-axis at which the projectile is fired: ');
x_acc = input('X-COMPONENT of the acceleration, considering the sign, in m/s^2: ');
y_acc = input('Y-COMPONENT of the acceleration, considering the sign, in m/s^2: ');

if y_acc ==0 
    error('Vertical acceleration must not be zero')
elseif velocity<0
    error('Magnitude of the velocity cannot be zero')
elseif height<0
    error('Initial height nust be from above ground')
end

time = ((velocity*sind(theta)) + sqrt((velocity*sind(theta))^2 + 2*abs(y_acc)*height))/abs(y_acc)
t_vector = linspace(0,time,1000);
    %--ideal time for the trajectory to hit the ground(gravity = -9.8)---%
ideal_time = ((velocity*sind(theta)) + sqrt((velocity*sind(theta))^2 + 2*abs(-9.8)*height))/abs(-9.8);
ideal_tvector = linspace(0,ideal_time,1000);

horizontal_eqn = [(x_acc)/2, velocity*cosd(theta), 0];
vertical_eqn = [(y_acc)/2, velocity*sind(theta), height];                
    %--ideal trajectory of the projectile(the only acceleration is gravity = -9.8)--%
ideal_h_eqn = [velocity*cosd(theta),0];
ideal_v_eqn = [-4.9,velocity*sind(theta),height];

h_vector = polyval(horizontal_eqn,t_vector);
v_vector = polyval(vertical_eqn, t_vector);
    %--vector for the ideal trajectory of the projectile----------------%
ideal_h_vector = polyval(ideal_h_eqn,ideal_tvector);        
ideal_v_vector = polyval(ideal_v_eqn,ideal_tvector);

plot(h_vector,v_vector,'linewidth',2.2)
hold on 
plot(ideal_h_vector,ideal_v_vector,'linewidth',2.2)
grid 
legend('Non-ideal Trajectory','Ideal Trajectory')
xlabel('Horizontal Displacement')
ylabel('Vertical Displacement')
title('Projectile Trajectory')

end
