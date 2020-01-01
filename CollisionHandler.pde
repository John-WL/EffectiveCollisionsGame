import java.util.function.Consumer;

final class CollisionHandler
{
    private final Collection<CollisionArea> collisionAreas;
    private final Consumer<Particle> collisionEventConsumer;

    public CollisionHandler(final Collection<CollisionArea> collisionAreas, final Consumer<Particle> collisionEventConsumer)
    {
        this.collisionAreas = collisionAreas;
        this.collisionEventConsumer = collisionEventConsumer;
    }

    public void updateCollisionAreas()
    {
        
    }

    public void collideParticles()
    {
        final Collection<Collision> collisions = new ArrayList<Collision>();

        for(final CollisionArea area: this.collisionAreas)
        {
            collisions.addAll(area.getCollisions());
        }

        for(final Collision collision: collisions)
        {
            collision.updateParticlesProperties(); //<>//
            collision.addParticlesTo(this.collisionEventConsumer);
        } //<>//
    }
    
    public void showCollisionAreas()
    {
        for(final CollisionArea area: this.collisionAreas)
        {
            area.show();
        }
    }
}
