using NbaManagement.Database;
using System.Collections.Generic;
using System.Data.Entity;
using System.Threading.Tasks;

namespace NbaManagement.Services
{
    public class TeamService
    {
        private readonly DatabaseContext _dbContext;

        public TeamService(DatabaseContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IEnumerable<Team>> GetTeamsAsync() => await _dbContext.Team.ToArrayAsync();
    }
}