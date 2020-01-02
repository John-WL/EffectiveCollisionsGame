public final class CollisionHandler
{
    private final Collection<CollisionArea> collisionAreas;
    private final Consumer<Particle> collidingParticleConsumer;

    public CollisionHandler(final Collection<CollisionArea> collisionAreas, final Consumer<Particle> collidingParticleConsumer)
    {
        this.collisionAreas = collisionAreas;
        this.collidingParticleConsumer = collidingParticleConsumer;
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
            collision.addParticlesTo(this.collidingParticleConsumer);
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
