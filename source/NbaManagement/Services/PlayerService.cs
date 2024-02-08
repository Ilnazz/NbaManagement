using NbaManagement.Database;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace NbaManagement.Services
{
    public class PlayerService
    {
        private readonly DatabaseContext _dbContext;
        
        public PlayerService(DatabaseContext dbContext) => _dbContext = dbContext;

        public async Task<IEnumerable<Player>> GetPlayersAsync() => await _dbContext.Player.ToArrayAsync();

        public IEnumerable<Player> GetPlayers() => _dbContext.Player.ToArray();
    }
}