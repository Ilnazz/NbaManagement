using NbaManagement.Database;
using System.Collections.Generic;

namespace NbaManagement.Services
{
    public class TeamService
    {
        private readonly DatabaseContext _dbContext;

        public TeamService(DatabaseContext dbContext) => _dbContext = dbContext;

        public IEnumerable<Division> GetDivisions() => _dbContext.Divisions.Local;

        public IEnumerable<Conference> GetConferences() => _dbContext.Conferences.Local;
    }
}