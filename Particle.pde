public final class Particle
{
    public static final int RADIUS = 50;
    
    private Vector2 position;
    private Vector2 speed;

    public Particle(Vector2 position, Vector2 speed)
    {
        this.position = position;
        this.speed = speed;
    }

    public void updatePropertiesOfThisAnd(Particle that)
    {
        final Vector2 normal = that.position.sub(this.position);
        this.speed = this.speed.reflect(normal);
        that.speed = that.speed.reflect(normal.mul(-1));
        
        Vector2 temporarySpeed = this.speed;
        this.speed = that.speed;
        that.speed = temporarySpeed;
    }
    
    public boolean hasFinishedToActualize()
    {
        return speed.normSquared() < 0.001;
    }

    public void actualize()
    {
        if(position.getX() < 0 || position.getX() > width)
        {
            speed.setX(-speed.getX());
        }
        if(position.getY() < 0 || position.getY() > height)
        {
            speed.setY(-speed.getY());
        }

        position = position.add(speed);
        speed = speed.div(1.01);
    }
    
    public Vector2 getPosition()
    {
        return position;
    }
    
    public void setPosition(Vector2 position)
    {
        this.position = position;
    }
    
    public boolean isCollidingWith(Particle that)
    {
        return position.sub(that.position).normSquared() < RADIUS * RADIUS;
    }
    
    public void show()
    {
        ellipse(this.position.getX(), this.position.getY(), RADIUS, RADIUS);
    }
}
