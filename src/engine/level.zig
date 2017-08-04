const TILE_SIZE = 64.0;

const Level = struct {
	renderer: &BatchRenderer,
	tileSize: usize,
	levelData: String,
	playerStartPosition: vec2,

	init(const string& filename, renderer: &IMRenderer) -> Level {

		const l = Level {
			.renderer = renderer,
			.levelData = undefined,
			.playerStartPosition = vec2(0, 0),
		}

		ArrayList(string) levelMap = IOManager::readLines(filename);

		const uvRect = vec4(0.0f, 0.0f, 1.0f, 1.0f);
		_renderer.begin();

		// Cycle through lines in levelData
		for (levelData) |line, row| {
			for (line) |sym, col| {

				const destRect = vec4(col * TILE_SIZE, row * TILE_SIZE, TILE_SIZE, TILE_SIZE);

				switch (sym) {
					// Agents
					'@' => {
						_playerStartPosition.x = col * TILE_SIZE;
						_playerStartPosition.y = row * TILE_SIZE;
						_levelData[row][col] = ' ';
						_renderer.submit(destRect, uvRect, getTexture("data/tiles/tile_01.png").id,
											1.0f, ColourRGBA8(255, 255, 255, 255));
					},
					'X' => {
						_enemyStartPositions.emplace_back(col * TILE_SIZE, row * TILE_SIZE);
						_levelData[row][col] = ' ';
						_renderer.submit(destRect, uvRect, getTexture("data/tiles/tile_01.png").id,
											1.0f, ColourRGBA8(255, 255, 255, 255));
					},
					// Top Tiles
					'*' => {
						_renderer.submit(destRect, uvRect, getTexture("data/tiles/tile_183.png").id,
											1.0f, ColourRGBA8(255, 255, 255, 255));
					// Base Tile
					' ' => {
						_renderer.submit(destRect, uvRect, getTexture("data/tiles/tile_01.png").id,
											1.0f, ColourRGBA8(255, 255, 255, 255));
					},
					// Tiles
					'#' => {
						_renderer.submit(destRect, uvRect, getTexture("res/textures/bricks_top.png").id,
											1.0f, ColourRGBA8(255, 255, 255, 255));
					},
					else => {
						printf("Unexpected symbol %c at row %d, col %d", sym, row, col);
					},
				}
			}
		}

		_renderer.end();
	}

	void draw(l: &Level)
	{
		l.renderer.render();
	}

	bool save(const string& filePath, const PlatformPlayer& player, const ArrayList(Box)& boxes, const vector<Light2D>& lights)
	{
	}

	bool load(ifstream& file, b2World* world, PlatformPlayer& player, ArrayList(Box)& boxes, vector<Light2D>& lights) {
		{ // Read player
			player.init(world, pos, ddims, cdims, color);
		}
		
		{ // Read boxes
			texture = getTexture(texturePath);
			boxes.emplace_back(world, pos, dims, texture, color, fixedRotation, isDynamic, angle, uvRect);
		}
		
		{ // Read lights
			lights.emplace_back(color, pos, size);
		}
	}

	pub fn getWidth() -> usize {
		return _levelData[0].size(); 
	}
	
	pub fn getHeight() -> usize {
		return _levelData.size(); 
	}
}

