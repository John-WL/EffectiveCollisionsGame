import java.util.List;

final class CollisionHandler
{
    final Collection<CollisionArea> collisionAreas;
    final ParticleHandler particleHandler;

    public CollisionHandler(final Collection<CollisionArea> collisionAreas, final ParticleHandler particleHandler)
    {
        this.collisionAreas = collisionAreas;
        this.particleHandler = particleHandler;
    }

    public void updateCollisionAreas()
    {
        
    }

    public void actualizeParticles()
    {
        final Collection<Collision> collisions = new ArrayList<Collision>();

        for(final CollisionArea area: this.collisionAreas)
        {
            collisions.addAll(area.getCollisions());
        }

        for(final Collision collision: collisions)
        {
            collision.updateParticlesProperties(); //<>//
            collision.addParticlesTo(this.particleHandler);
        }
        
        particleHandler.actualizeParticles();
    }
    
    public void printCollisionAreas()
    {
        for(final CollisionArea area: this.collisionAreas)
        {
            area.print();
        }
    }
}
