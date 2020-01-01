public final class Vector2
{
    private float x;
    private float y;
  
    public Vector2()
    {
        x = 0;
        y = 0;
    }
    
    public Vector2(float x, float y)
    {
        this.x = x;
        this.y = y;
    }
    
    public boolean isNormZero()
    {
        return x == 0 && y == 0;
    }
    
    public float normSquared()
    {
        return x*x + y*y;
    }
    
    public float norm()
    {
        return (float) Math.sqrt(normSquared());
    }
    
    public Vector2 complexMul(Vector2 factor)
    {
        final float newX = this.x * factor.x - this.y * factor.y;
        final float newY = this.x * factor.y + factor.x * this.y;
        return new Vector2(newX, newY);
    }
    
    public Vector2 complexDiv(Vector2 divisor)
    {
        return complexMul(new Vector2(divisor.x, -divisor.y)).div(divisor.normSquared());
    }
    
    public Vector2 reflect(Vector2 mirror)
    {
        if(isNormZero())
        {
            return new Vector2();
        }
        final Vector2 halfAngleToAdd = mirror.complexDiv(this);
        final Vector2 misnormedAngleToAdd = halfAngleToAdd.complexMul(halfAngleToAdd);
        final Vector2 angleToAdd = misnormedAngleToAdd.unit();
        return this.complexMul(angleToAdd);
    }
    
    public Vector2 unit()
    {
        return div(norm());
    }
  
    public Vector2 add(Vector2 vector)
    {
        return new Vector2(this.x + vector.x, this.y + vector.y);
    }
    
    public Vector2 sub(Vector2 vector)
    {
        return new Vector2(this.x - vector.x, this.y - vector.y);
    }
    
    public Vector2 mul(float factor)
    {
        return new Vector2(x * factor, y * factor);
    }
    
    public Vector2 div(float divisor)
    {
        return new Vector2(x / divisor, y / divisor);
    }
    
    public float getX()
    {
        return x;
    }
    
    public float getY()
    {
        return y;
    }
    
    public void setX(float x)
    {
        this.x = x;
    }
    
    public void setY(float y)
    {
        this.y = y;
    }
}
