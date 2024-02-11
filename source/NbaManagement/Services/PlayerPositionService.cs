using NbaManagement.Database;
using System.Linq;

namespace NbaManagement.Services
{
    public class PlayerPositionService
    {
        public PlayerPosition SmallForward => GetPositionById(1);

        public PlayerPosition PowerForward => GetPositionById(2);

        public PlayerPosition Center => GetPositionById(3);

        public PlayerPosition ShootingGuard => GetPositionById(4);

        public PlayerPosition PointGuard => GetPositionById(5);

        private readonly DatabaseContext _dbContext;

        public PlayerPositionService(DatabaseContext dbContext) => _dbContext = dbContext;

        private PlayerPosition GetPositionById(int positionId) =>
            _dbContext.PlayerPositions.First(position => position.Id == positionId);
    }
}