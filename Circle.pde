public class Circle
{
    private final Vector2 center;
    private final float radius;
  
    public Circle(Vector2 center, float radius)
    {
        this.center = center;
        this.radius = radius;
    }
    
    public void print()
    {
        ellipse(center.getX(), center.getY(), radius, radius);
    }
}
